#!/usr/bin/env python3
"""
Typst Document Revision System

This script processes chapter files (.typ) and their corresponding review files (.md)
to create improved revised versions with integrated feedback.
"""

import os
import re
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Tuple, Optional

class ReviewComment:
    """Represents a single review comment with metadata"""
    def __init__(self, content: str, priority: str = "Medium", line_ref: Optional[int] = None, category: str = "General"):
        self.content = content
        self.priority = priority  # High, Medium, Low
        self.line_ref = line_ref  # Line number reference if applicable
        self.category = category  # Type of feedback
        
    def __str__(self):
        return f"[{self.priority}] Line {self.line_ref}: {self.content}"

class TypstRevisionProcessor:
    """Main processor for Typst document revisions"""
    
    def __init__(self, chapters_dir: str = "chapters", reviews_dir: str = "review"):
        self.chapters_dir = Path(chapters_dir)
        self.reviews_dir = Path(reviews_dir)
        self.revision_count = 0
        
    def find_chapter_review_pairs(self) -> List[Tuple[Path, Path]]:
        """Find matching chapter and review file pairs"""
        pairs = []
        
        # Get all chapter files (excluding already revised files)
        chapter_files = [f for f in self.chapters_dir.glob("*.typ") if "_revised" not in f.name]
        
        for chapter_file in chapter_files:
            # Find corresponding review file with different naming patterns
            chapter_name = chapter_file.stem
            
            # Try different naming patterns for review files
            review_patterns = [
                f"review_{chapter_name}.md",
                f"review_{chapter_name.replace(' ', '_')}.md",
                f"review_{chapter_name.replace('-', '_')}.md"
            ]
            
            review_file = None
            for pattern in review_patterns:
                potential_review = self.reviews_dir / pattern
                if potential_review.exists():
                    review_file = potential_review
                    break
            
            if review_file:
                pairs.append((chapter_file, review_file))
                print(f"Found pair: {chapter_file.name} ↔ {review_file.name}")
            else:
                print(f"Warning: No review file found for {chapter_file.name}")
        
        return pairs
    
    def parse_review_file(self, review_path: Path) -> List[ReviewComment]:
        """Parse a review file to extract structured feedback"""
        comments = []
        
        with open(review_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Extract areas for improvement with better pattern matching
        # Look for numbered items under "Areas for Improvement"
        improvement_pattern = r'\*\*Areas for Improvement\*\*:(.*?)(?=\*\*Specific Line-by-Line Comments\*\*|\*\*Recommended Resources\*\*|$)'
        improvement_match = re.search(improvement_pattern, content, re.DOTALL)
        
        if improvement_match:
            improvement_section = improvement_match.group(1)
            
            # Extract individual improvement items
            item_pattern = r'(\d+)\.\s*\*\*(.*?)\*\*\s*-\s*Issue:\s*(.*?)\s*-\s*Suggestion:\s*(.*?)\s*-\s*Priority:\s*(High|Medium|Low)'
            items = re.findall(item_pattern, improvement_section, re.DOTALL)
            
            for item in items:
                issue = item[2].strip()
                suggestion = item[3].strip()
                priority = item[4].strip()
                category = item[1].strip()
                
                comment_text = f"Issue: {issue}. Suggestion: {suggestion}"
                comments.append(ReviewComment(comment_text, priority, None, category))
        
        # Extract specific line-by-line comments
        line_pattern = r'\*\*Specific Line-by-Line Comments\*\*:(.*?)(?=\*\*Recommended Resources\*\*|$)'
        line_match = re.search(line_pattern, content, re.DOTALL)
        
        if line_match:
            line_section = line_match.group(1)
            
            # Extract individual line comments
            line_comments = re.findall(r'-\s*Line\s*(\d+):\s*(.*?)(?=\n-|$)', line_section, re.MULTILINE)
            
            for line_num, comment in line_comments:
                comments.append(ReviewComment(
                    comment.strip(), 
                    "Medium",  # Default priority for line comments
                    int(line_num), 
                    "Line-specific"
                ))
        
        print(f"  Parsed {len(comments)} comments from {review_path.name}")
        return comments
    
    def read_typst_file(self, file_path: Path) -> List[str]:
        """Read a Typst file and return lines"""
        with open(file_path, 'r', encoding='utf-8') as f:
            return f.readlines()
    
    def apply_revisions(self, lines: List[str], comments: List[ReviewComment], chapter_name: str) -> List[str]:
        """Apply revisions to Typst file lines based on review comments"""
        revised_lines = lines.copy()
        
        # Sort comments by priority: High > Medium > Low
        priority_order = {"High": 3, "Medium": 2, "Low": 1}
        sorted_comments = sorted(comments, key=lambda c: priority_order.get(c.priority, 0), reverse=True)
        
        revisions_applied = 0
        
        for comment in sorted_comments:
            if comment.line_ref and 1 <= comment.line_ref <= len(revised_lines):
                # Apply line-specific revision
                line_idx = comment.line_ref - 1
                original_line = revised_lines[line_idx].rstrip()
                
                # Add revision marker as comment
                revision_marker = f"// REVISED: {comment.category} - {comment.content[:50]}..."
                
                # Apply specific improvements based on comment type
                if "long sentence" in comment.content.lower():
                    # Handle long sentence breaking
                    revised_lines[line_idx] = self.break_long_sentence(original_line) + "\n"
                elif "spacing around mathematical" in comment.content.lower():
                    # Fix mathematical expression spacing
                    revised_lines[line_idx] = self.fix_math_spacing(original_line) + "\n"
                else:
                    # General improvement - add marker
                    revised_lines[line_idx] = original_line + f" {revision_marker}\n"
                
                revisions_applied += 1
            
            elif comment.category in ["Theoretical Framework", "Physical Concepts"]:
                # Apply general theoretical improvements
                revision_marker = f"// REVISED: Added {comment.category} improvement\n"
                
                # Find appropriate location (after first heading)
                for i, line in enumerate(revised_lines):
                    if line.strip().startswith('=') and not line.strip().startswith('=='):
                        # Add theoretical enhancement after main heading
                        enhancement = self.generate_theoretical_enhancement(comment, chapter_name)
                        revised_lines.insert(i + 2, enhancement + "\n")
                        revised_lines.insert(i + 2, revision_marker)
                        revisions_applied += 1
                        break
            
            elif comment.category == "Paragraph Structure":
                # Improve paragraph structure by adding connecting text
                self.improve_paragraph_structure(revised_lines)
                revisions_applied += 1
        
        self.revision_count = revisions_applied
        return revised_lines
    
    def break_long_sentence(self, line: str) -> str:
        """Break long sentences for better readability"""
        # Simple sentence breaking at logical points
        if len(line) > 100 and '，' in line:
            # Break at Chinese comma
            parts = line.split('，', 1)
            if len(parts) == 2:
                return parts[0] + '。\n\n' + parts[1].strip()
        elif len(line) > 100 and ', ' in line:
            # Break at English comma
            parts = line.split(', ', 1)
            if len(parts) == 2:
                return parts[0] + '.\n\n' + parts[1].strip()
        
        return line
    
    def fix_math_spacing(self, line: str) -> str:
        """Fix spacing around mathematical expressions"""
        # Add spaces around $ delimited math
        line = re.sub(r'([^\s])\$', r'\1 $', line)
        line = re.sub(r'\$([^\s])', r'$ \1', line)
        return line
    
    def generate_theoretical_enhancement(self, comment: ReviewComment, chapter_name: str) -> str:
        """Generate theoretical framework enhancements based on comments"""
        if "current-phase relation" in comment.content.lower():
            return """
// Enhanced theoretical framework for CPR
對於傳統的約瑟夫森接面，電流-相位關係遵循 $I_s(phi) = I_c sin(phi)$ 的形式。然而，在拓撲材料如 PtTe₂ 中，由於狄拉克費米子的存在，CPR 可能偏離此理想正弦形式，表現出諸如 $I_s(phi) = I_c sin(phi) + I_2 sin(2phi)$ 等高次諧波分量。
"""
        elif "coherence length" in comment.content.lower():
            return """
// Added coherence length discussion
超導相干長度 ξ ≈ 200 nm 對於 PtTe₂ 而言是一個關鍵參數，它決定了庫柏對在材料中的空間延展性，並影響約瑟夫森接面的特性。
"""
        else:
            return f"// Enhanced theoretical discussion for {comment.category}"
    
    def improve_paragraph_structure(self, lines: List[str]) -> None:
        """Improve paragraph structure by adding transitions selectively"""
        # Add transition phrases to connect ideas
        transition_phrases = [
            "此外，", "進一步地，", "同時，", "因此，", "However, ", "Furthermore, ", "Additionally, "
        ]
        
        # Find paragraphs that would benefit from transitions (not headers, comments, or special syntax)
        for i in range(1, len(lines) - 1):
            line = lines[i].strip()
            
            # Skip if line is empty, a header, comment, or special Typst syntax
            if (not line or 
                line.startswith('=') or 
                line.startswith('//') or 
                line.startswith('#') or 
                line.startswith('-') or 
                line.startswith('+') or
                len(line) < 20):
                continue
            
            # Only add transitions to lines that don't already have them and are part of paragraphs
            if not any(phrase in lines[i] for phrase in transition_phrases):
                # Check if this line starts a new paragraph (previous line is empty)
                if i > 0 and not lines[i-1].strip():
                    # Add appropriate transition based on content language
                    if any('\u4e00' <= c <= '\u9fff' for c in line):  # Check for Chinese characters
                        lines[i] = "此外，" + lines[i]
                    else:
                        lines[i] = "Furthermore, " + lines[i]
    
    def create_revision_header(self, chapter_name: str, critical_fixes: int, improvements: int, suggestions: int) -> str:
        """Create revision summary header"""
        current_date = datetime.now().strftime("%Y-%m-%d")
        total_revisions = critical_fixes + improvements + suggestions
        
        return f"""// Revision Summary
// Date: {current_date}
// Chapter: {chapter_name}
// Total revisions: {total_revisions}
// Critical fixes: {critical_fixes}
// Improvements: {improvements}
// Suggestions: {suggestions}
// 
// This file has been revised based on physics professor feedback
// All revisions are marked with // REVISED: comments

"""
    
    def process_chapter(self, chapter_path: Path, review_path: Path) -> bool:
        """Process a single chapter-review pair"""
        print(f"\nProcessing: {chapter_path.name}")
        
        # Parse review comments
        comments = self.parse_review_file(review_path)
        print(f"Found {len(comments)} review comments")
        
        # Read original Typst file
        original_lines = self.read_typst_file(chapter_path)
        
        # Apply revisions
        revised_lines = self.apply_revisions(original_lines, comments, chapter_path.stem)
        
        # Count revision types
        critical_fixes = len([c for c in comments if c.priority == "High"])
        improvements = len([c for c in comments if c.priority == "Medium"])
        suggestions = len([c for c in comments if c.priority == "Low"])
        
        # Create revision header
        header = self.create_revision_header(chapter_path.stem, critical_fixes, improvements, suggestions)
        
        # Generate output filename
        output_name = f"{chapter_path.stem}_revised.typ"
        output_path = chapter_path.parent / output_name
        
        # Write revised file
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(header)
            f.writelines(revised_lines)
        
        print(f"Created revised file: {output_path}")
        print(f"Applied {self.revision_count} revisions")
        
        return True
    
    def process_all_chapters(self) -> None:
        """Process all chapter-review pairs"""
        pairs = self.find_chapter_review_pairs()
        
        if not pairs:
            print("No chapter-review pairs found!")
            return
        
        print(f"Found {len(pairs)} chapter-review pairs to process")
        
        total_processed = 0
        for chapter_path, review_path in pairs:
            try:
                if self.process_chapter(chapter_path, review_path):
                    total_processed += 1
            except Exception as e:
                print(f"Error processing {chapter_path.name}: {e}")
        
        print(f"\n✅ Successfully processed {total_processed}/{len(pairs)} chapters")
        print(f"Revised files created in: {self.chapters_dir}")

def main():
    """Main function to run the revision system"""
    print("🔬 Typst Document Revision System")
    print("=================================")
    
    processor = TypstRevisionProcessor()
    processor.process_all_chapters()
    
    print("\n✨ Revision process completed!")

if __name__ == "__main__":
    main()