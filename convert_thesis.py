import re
import os
import subprocess

# Configuration
BASE_DIR = "/Users/albert-mac/Code/GitHub/Thesis"
OUTPUT_FILE = os.path.join(BASE_DIR, "Quarto/quarto.qmd")
INFO_FILE = os.path.join(BASE_DIR, "info.typ")
CHAPTERS = [
    "chapters/Ch1-Introduction.typ",
    "chapters/Ch2-Theoretical Background-body.typ",
    "chapters/Ch3-Experimental Methods.typ",
    "chapters/ch4-Results.typ",
    "chapters/Ch5-Discussion.typ",
    "chapters/Ch6-Conclusion and Prospect.typ"
]
BIB_FILE = "../references.bib"

def read_file(path):
    with open(os.path.join(BASE_DIR, path), 'r', encoding='utf-8') as f:
        return f.read()

def parse_info_typ(content):
    info = {}
    lines = content.split('\n')
    for line in lines:
        line = line.strip()
        if ':' in line:
            key, val = line.split(':', 1)
            key = key.strip()
            val = val.strip().rstrip(',')
            # Remove wrapping [ ] or " "
            if val.startswith('[') and val.endswith(']'):
                val = val[1:-1]
            elif val.startswith('"') and val.endswith('"'):
                val = val[1:-1]
            info[key] = val
    return info


def preprocess_typst(content):
    # Remove imports and sets
    lines = content.split('\n')
    cleaned_lines = []
    for line in lines:
        if line.strip().startswith('#import') or line.strip().startswith('#set') or line.strip().startswith('#show') or line.strip().startswith('#include'):
            continue
        if line.strip().startswith('//'):
            continue
        cleaned_lines.append(line)
    
    content = '\n'.join(cleaned_lines)
    
    # Handle 'include "..."'
    # Use valid Typst syntax: [Included ...] (content block)
    content = re.sub(r'(?:#)?include\s+"(.*?)"', r'[Included content from \1]', content)
    
    # Replace #ce[Formula] with simple text (remove the macro)
    # Example: #ce[PtTe2] -> PtTe2
    content = re.sub(r'#ce\[(.*?)\]', r'\1', content)
    
    # Fix image paths: ../Images/ -> Images/
    # (Since we are moving context to Quarto/ folder which has Images/ symlinked or copied)
    content = content.replace('../Images/', 'Images/')
    
    # Replace #bold[...] -> *...* (Typst bold) or bold(...) in math
    # In text mode, #bold[...] -> *...*
    # Inside math, bold(...)
    content = re.sub(r'#bold\[(.*?)\]', r'*\1*', content)
    
    # Math replacement for physica/VB
    # vb(B) -> bold(B) (Standard Typst math)
    content = re.sub(r'vb\((.*?)\)', r'bold(\1)', content)
    
    # Replace Planck constant
    # Typst standard for h-bar is planck.reduce
    content = re.sub(r'planck', r'planck.reduce', content)
    
    # Replace 'arrow(r)' with 'arrow(r)' (already standard, but ensuring no custom calls)
    # No change needed if arrow is standard.
    
    return content


def run_pandoc(content):
    # Determine pandoc path
    pandoc_cmd = ["pandoc", "-f", "typst", "-t", "markdown", "--wrap=none"]
    
    process = subprocess.Popen(
        pandoc_cmd,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )
    stdout, stderr = process.communicate(input=content)
    
    if process.returncode != 0:
        print(f"Pandoc warning/error: {stderr}")
        # Fallback? If pandoc fails, we might just use the text.
        # But let's hope stripping imports fixes the major crashes.
        return stdout # Return whatever we got
    
    return stdout

def postprocess_markdown(content):
    # Fix headers if Pandoc messed them up or if we want specific adjustments
    # Pandoc: # Header 1 -> # Header 1 { #label }
    # Quarto prefers: # Header 1 { #label } or just # Header 1
    
    # Fix citations: @ref -> [@ref]
    # Typst: @ref
    # Pandoc markdown output for Typst @ref might be @ref or [@ref].
    # Let's inspect. Usually Pandoc converts @ref to @ref. Quarto needs [@ref] for standard citations, 
    # BUT Quarto also supports @ref for "in-text" citations.
    # The guide says "Tip: @ref -> [@ref]".
    # We will enforce brackets if missing.
    # Regex: find @key that is NOT enclosed in [].
    # This is tricky because of email addresses or other uses. 
    # But usually citations are @name_title_year.
    
    # Converting Typst figures to Quarto figures (if Pandoc didn't do it perfectly)
    # Pandoc typically produces: ![Caption](path)
    # We want: ![Caption](path){#fig-label}
    # Typst source: #figure(image(...), caption: [...]) <label>
    # Pandoc sometimes loses the label.
    # We'll see what Pandoc produces.
    
    # Fix image paths.
    # Content is going into `Quarto/quarto.qmd`.
    # Typst paths are usually relative to the file, e.g. `../Images/foo.png`.
    # If `quarto.qmd` is in `Quarto/`, and images are in `Images/`, then `../Images/foo.png` is CORRECT.
    # So we don't need to change paths if they are already `../Images`.
    
    return content

def main():
    print("Starting conversion...")
    
    # Parse info
    info_content = read_file("info.typ")
    info_data = parse_info_typ(info_content)
    
    title = info_data.get("title-en", "Thesis Title")
    author = info_data.get("author-en", "Author Name")
    
    # Clean up title if it contains Typst formatting
    # Case: Study ... 1T-$bold(#ce[PtTe2])$ ...
    # We want: Study ... 1T-PtTe$_2$ ...
    # Step 1: Remove $bold(#ce[...])$ wrapper
    title = re.sub(r'\$bold\(#ce\[(.*?)\]\)\$', r'\1', title)
    title = re.sub(r'#ce\[(.*?)\]', r'\1', title)
    # Step 2: Fix PtTe2 -> PtTe$_2$ (simple heuristic)
    title = title.replace("PtTe2", "PtTe$_2$")
    
    print(f"Detected Title: {title}")
    print(f"Detected Author: {author}")
    
    final_content = []
    
    # Header
    header = f"""---
title: "{title}"
author: "{author}"
format:
  revealjs:
    slide-number: true
    width: 1600
    height: 900
    theme: default
bibliography: {BIB_FILE}
---

"""
    final_content.append(header)
    
    for chapter_path in CHAPTERS:
        print(f"Processing {chapter_path}...")
        raw_typst = read_file(chapter_path)
        cleaned_typst = preprocess_typst(raw_typst)
        
        # We need to manually handle figures BEFORE pandoc if we want to preserve labels robustly,
        # OR we trust pandoc.
        # Let's try pandoc first.
        
        md_output = run_pandoc(cleaned_typst)
        
        # Post-process
        md_output = postprocess_markdown(md_output)
        
        final_content.append(md_output)
        final_content.append("\n\n")
        
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        f.write("".join(final_content))
        # Append Bibliography Section for Quarto/RevealJS
        f.write("\n\n# 參考文獻 {background-color=\"#40666e\"}\n\n::: {#refs}\n:::\n")
    
    print(f"Done! Written to {OUTPUT_FILE}")

if __name__ == "__main__":
    main()
