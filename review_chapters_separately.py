#!/usr/bin/env python3
"""
Individual Chapter Review System
===============================

This script reviews each chapter separately and saves individual review files.
Each chapter gets its own detailed review file with the naming pattern:
review_Ch1_introduction.md, review_Ch2_SQUID.md, etc.

Usage:
    python review_chapters_separately.py chapters/

Author: Physics Professor Review AI
Version: 1.0
"""

import os
import sys
from pathlib import Path
from physics_professor_reviewer import PhysicsProfessorReviewer
import re

def sanitize_filename(filename):
    """Convert chapter filename to review filename"""
    # Remove extension and convert to review filename
    name = Path(filename).stem
    # Replace spaces and special characters with underscores
    name = re.sub(r'[^\w\-_]', '_', name)
    # Remove multiple consecutive underscores
    name = re.sub(r'_+', '_', name)
    # Remove leading/trailing underscores
    name = name.strip('_')
    return f"review_{name}.md"

def generate_individual_chapter_header(chapter_file):
    """Generate header for individual chapter review"""
    header = []
    header.append("# Physics Professor Thesis Review")
    header.append(f"## Individual Chapter Analysis: {Path(chapter_file).name}")
    header.append("")
    header.append("*As your thesis advisor, I've carefully reviewed this chapter of your thesis on 'Flux Controlled Current-Phase Relation in 1T-PtTe2 SQUIDs'. Below are my detailed comments and suggestions for improvement.*")
    header.append("")
    header.append("---")
    header.append("")
    return "\n".join(header)

def generate_individual_chapter_footer():
    """Generate footer for individual chapter review"""
    footer = []
    footer.append("---")
    footer.append("")
    footer.append("## Chapter Summary")
    footer.append("")
    footer.append("This individual chapter review provides targeted feedback for improvement. Consider:")
    footer.append("1. Addressing high-priority issues first")
    footer.append("2. Using recommended resources for deeper understanding")
    footer.append("3. Implementing suggestions systematically")
    footer.append("4. Re-reviewing after making changes")
    footer.append("")
    footer.append("*Remember: These suggestions are meant to enhance your work. Focus on the high-priority items first for maximum impact.*")
    footer.append("")
    return "\n".join(footer)

def main():
    """Main function to review all chapters separately"""
    if len(sys.argv) < 2:
        print("Usage: python review_chapters_separately.py <chapters_directory>")
        sys.exit(1)
    
    chapters_dir = sys.argv[1]
    chapters_path = Path(chapters_dir)
    
    if not chapters_path.exists():
        print(f"Error: Chapters directory {chapters_dir} not found")
        sys.exit(1)
    
    # Find all chapter files
    chapter_files = []
    for pattern in ['Ch*.typ', 'ch*.typ']:
        chapter_files.extend(chapters_path.glob(pattern))
    
    chapter_files.sort()
    
    if not chapter_files:
        print(f"No chapter files found in {chapters_dir}")
        sys.exit(1)
    
    # Create review directory if it doesn't exist
    review_dir = Path("review")
    review_dir.mkdir(exist_ok=True)
    
    reviewer = PhysicsProfessorReviewer()
    reviewed_files = []
    
    print(f"Found {len(chapter_files)} chapters to review individually...")
    print()
    
    # Review each chapter separately
    for chapter_file in chapter_files:
        print(f"📖 Reviewing {chapter_file.name}...")
        
        # Generate review for this chapter
        review = reviewer.review_chapter(str(chapter_file))
        
        # Create individual review content
        content = []
        content.append(generate_individual_chapter_header(str(chapter_file)))
        content.append(reviewer.format_review_output(review))
        content.append(generate_individual_chapter_footer())
        
        # Generate output filename
        output_filename = sanitize_filename(chapter_file.name)
        output_path = review_dir / output_filename
        
        # Write individual review file
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write("\n".join(content))
        
        reviewed_files.append(output_path)
        print(f"   ✅ Saved review to {output_path}")
    
    print()
    print("=" * 60)
    print("🎉 All chapters reviewed successfully!")
    print()
    print("📁 Individual review files created:")
    for review_file in reviewed_files:
        file_size = review_file.stat().st_size
        line_count = len(review_file.read_text(encoding='utf-8').split('\n'))
        print(f"   • {review_file.name} ({line_count} lines, {file_size} bytes)")
    
    print()
    print("📋 Summary:")
    print(f"   • {len(reviewed_files)} chapters reviewed")
    print(f"   • Reviews saved in '{review_dir}/' directory")
    print(f"   • Each chapter has its own dedicated review file")
    
    # Create an index file
    index_path = review_dir / "README.md"
    with open(index_path, 'w', encoding='utf-8') as f:
        f.write("# Individual Chapter Reviews\n\n")
        f.write("This directory contains individual review files for each chapter of the thesis.\n\n")
        f.write("## Review Files\n\n")
        for i, review_file in enumerate(reviewed_files, 1):
            chapter_name = review_file.name.replace('review_', '').replace('_', ' ').replace('.md', '')
            f.write(f"{i}. [{chapter_name}]({review_file.name})\n")
        f.write("\n## Usage\n\n")
        f.write("Each review file contains:\n")
        f.write("- Overall chapter assessment\n")
        f.write("- Identified strengths\n")
        f.write("- Areas for improvement (prioritized)\n")
        f.write("- Recommended resources\n")
        f.write("- Specific suggestions for enhancement\n")
    
    print(f"   • Index file created: {index_path}")
    print()

if __name__ == "__main__":
    main()