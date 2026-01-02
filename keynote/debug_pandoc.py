import os
import subprocess
import re

INPUT_FILE = "chapters/Ch2-Theoretical Background-body.typ.temp"

def test_conversion(content, name):
    # write to tmp
    tmp_name = f"debug_{name}.typ"
    with open(tmp_name, "w") as f:
        f.write(content)
    
    cmd = [
        "pandoc",
        tmp_name,
        "-f", "typst",
        "-t", "markdown",
        "--wrap=none"
    ]
    try:
        subprocess.run(cmd, check=True, capture_output=True)
        print(f"[{name}] SUCCESS")
        return True
    except subprocess.CalledProcessError as e:
        print(f"[{name}] FAIL: {e.stderr.decode().strip()}")
        return False
    finally:
        if os.path.exists(tmp_name):
            os.remove(tmp_name)

def main():
    with open(INPUT_FILE, "r") as f:
        lines = f.readlines()

    sections = []
    current_section = []
    current_title = "preamble"
    
    for line in lines:
        if line.startswith("= ") or line.startswith("== ") or line.startswith("=== "):
            if current_section:
                sections.append((current_title, "".join(current_section)))
            current_section = []
            current_title = line.strip()
        current_section.append(line)
    
    if current_section:
        sections.append((current_title, "".join(current_section)))

    print(f"Found {len(sections)} sections.")
    
    for title, content in sections:
        print(f"Testing section: {title[:30]}...")
        if not test_conversion(content, "section"):
            print(f"Error potentially in section: {title}")
            # Identify which line in the original file this section corresponds to? 
            # Not needed, we just look at the content.
            print("-" * 20)
            print(content)
            print("-" * 20)
            break

if __name__ == "__main__":
    main()
