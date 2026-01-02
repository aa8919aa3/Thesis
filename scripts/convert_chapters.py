import os
import subprocess
import re
import shutil

# Configuration
SOURCE_DIR = "chapters"
OUTPUT_DIR = "keynote/chapters_qmd"
APPENDICES_SRC = "appendices"
APPENDICES_OUT = "keynote/appendices_qmd"
BIB_FILE = "references.bib"
SANITIZED_BIB_FILE = "keynote/references_sanitized.bib"

# Ensure output directories exist
os.makedirs(OUTPUT_DIR, exist_ok=True)
os.makedirs(APPENDICES_OUT, exist_ok=True)

def sanitize_bibliography():
    """ Creates a copy of references.bib with sanitized keys (no colons) in the keynote folder. """
    if not os.path.exists(BIB_FILE):
        print(f"Warning: {BIB_FILE} not found.")
        return

    print(f"Sanitizing bibliography to {SANITIZED_BIB_FILE}...")
    # Ensure keynote directory exists before writing bib file
    os.makedirs("keynote", exist_ok=True)
    
    with open(BIB_FILE, 'r', encoding='utf-8') as f_in, \
         open(SANITIZED_BIB_FILE, 'w', encoding='utf-8') as f_out:
        for line in f_in:
            # Check for entry start: @type{key,
            match = re.match(r'^@\w+\{([^,]+),', line)
            if match:
                key = match.group(1)
                if ':' in key:
                    new_key = key.replace(':', '_')
                    line = line.replace(key, new_key, 1) # Only replace first occurrence (the key)
            f_out.write(line)

def convert_file(input_path, output_path):
    print(f"Converting {input_path} to {output_path}...")
    
    # 1. Pre-processing (Sanitization)
    # Read the file content
    with open(input_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Create a temporary file for the sanitized content
    temp_input_path = input_path + ".temp"
    
    # Write to temp file with sanitization
    with open(temp_input_path, 'w', encoding='utf-8') as f:
        for line in content.splitlines():
            stripped = line.strip()
            # aggressive stripping of imports and settings that confuse pandoc's typst reader
            if stripped.startswith('#import') or stripped.startswith('#show') or stripped.startswith('#set'):
                continue
            # Also remove specific include that might be problematic if not recursive
            if stripped.startswith('#include '):
                # We might want to keep the content but Pandoc won't follow includes typically unless filtered
                # For now, let's keep it assuming we convert leaf files mostly
                pass
            
            # Replace #ce[...] with content. Simple regex for non-nested brackets.
            # Convert #ce[PtTe2] -> PtTe2 or similar
            # We use a simple replacement assuming no nested brackets in ce for now
            line = re.sub(r'#ce\[([^\]]*)\]', r'\1', line)

            # Replace physica vb(...) with bold(...)
            # vb is often used in math mode, e.g. $vb(B)$. 
            # In Typst math, bold() works. 
            # Simple word replacement is safer for nested parentheses.
            line = re.sub(r'\bvb\b', 'bold', line)

            # Replace physica dd(...) with dif ...
            # dd(x) -> dif(x) or dif x
            line = re.sub(r'\bdd\b', 'dif', line)
            
            # Sanitize citations: @foo:bar -> @foo_bar
            # Regex to find @... followed by word chars + colon + word chars
            # We assume keys don't have spaces.
            # We use a loop to handle multiple colons or multiple citations
            def replace_colon_in_citation(match):
                return match.group(0).replace(':', '_')
            
            # Pattern: @ followed by word chars, hyphens, underscores, colons
            # But ensure it contains at least one colon and isn't just a random word starting with @ 
            # (though in Typst @ usually means citation or reference)
            line = re.sub(r'@[a-zA-Z0-9\-_:]+', replace_colon_in_citation, line)

            f.write(line + "\n")

    # 2. Run Pandoc
    cmd = [
        "pandoc",
        temp_input_path,
        "-f", "typst",
        "-t", "markdown", # Standard markdown, Quarto will read it
        "-o", output_path,
        "--wrap=none"
    ]
    
    try:
        subprocess.run(cmd, check=True, capture_output=True)
    except subprocess.CalledProcessError as e:
        print(f"Error converting {input_path}: {e.stderr.decode()}")
        # We don't return False here, just log, so we can verify partial successes
        # But if it fails, the file might not be created.
        if os.path.exists(temp_input_path):
            os.remove(temp_input_path)
        return False

    # 3. Post-processing (Syntax Refactoring)
    with open(output_path, 'r', encoding='utf-8') as f:
        md_content = f.read()

    # Fix Image Paths:
    # We want all images to point to Images/ (relative to keynote/main.qmd, relying on symlink)
    # Patterns to match:
    # 1. ../Images/
    # 2. chapters/../Images/
    # 3. Images/
    # 4. /Images/ (if absolute path was used previously)
    
    # We will simply look for any path ending in "Images/" and replace the prefix with "Images/"
    # Regex: (src="|]\()  .*?Images/
    
    # Replace markdown style: ]( ... Images/foo.png) -> ](Images/foo.png)
    md_content = re.sub(r'\]\((?:[^)]*?)Images/', '](Images/', md_content)
    
    # Replace HTML style: src=" ... Images/foo.png" -> src="Images/foo.png"
    md_content = re.sub(r'src="(?:[^"]*?)Images/', 'src="Images/', md_content)
    
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(md_content)

    # Cleanup
    if os.path.exists(temp_input_path):
        os.remove(temp_input_path)
    
    return True

def main():
    sanitize_bibliography()
    
    # List of specific files to convert based on main.typ
    files_to_convert = [
        ("chapters/Ch1-Introduction.typ", "keynote/chapters_qmd/Ch1-Introduction.qmd"),
        ("chapters/Ch2-Theoretical Background-body.typ", "keynote/chapters_qmd/Ch2-Theoretical_Background-body.qmd"),
        ("chapters/Ch3-Experimental Methods.typ", "keynote/chapters_qmd/Ch3-Experimental_Methods.qmd"),
        ("chapters/Ch4-Results.typ", "keynote/chapters_qmd/Ch4-Results.qmd"),
        ("chapters/Ch5-Discussion.typ", "keynote/chapters_qmd/Ch5-Discussion.qmd"),
        ("chapters/Ch6-Conclusion and Prospect.typ", "keynote/chapters_qmd/Ch6-Conclusion_and_Prospect.qmd"),
        ("appendices/appendix.typ", "keynote/appendices_qmd/appendix.qmd"),
    ]

    for src, dst in files_to_convert:
        if os.path.exists(src):
            convert_file(src, dst)
        else:
            print(f"Warning: Source file {src} not found.")

if __name__ == "__main__":
    main()
