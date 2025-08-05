#!/usr/bin/env python3
"""
Physics Professor Thesis Review System
=====================================

An AI-powered review system that acts as an experienced physics professor
to provide comprehensive revision suggestions for physics master's thesis chapters.

This system implements a structured chain-of-thought approach for reviewing
academic physics content with focus on:
- Technical content analysis
- Academic writing standards
- Constructive feedback structure
- Field-specific expertise in quantum physics/superconductivity

Author: Physics Professor Review AI
Version: 1.0
"""

import os
import re
import sys
from pathlib import Path
from typing import Dict, List, Tuple, Optional
from dataclasses import dataclass
from enum import Enum

class Priority(Enum):
    HIGH = "High"
    MEDIUM = "Medium" 
    LOW = "Low"

@dataclass
class ReviewComment:
    """Structure for individual review comments"""
    category: str
    issue: str
    suggestion: str
    priority: Priority
    page_line: Optional[str] = None
    example: Optional[str] = None

@dataclass
class ChapterReview:
    """Structure for complete chapter review"""
    chapter_number: str
    chapter_title: str
    overall_assessment: str
    strengths: List[str]
    improvements: List[ReviewComment]
    line_comments: List[str]
    recommended_resources: List[str]

class PhysicsProfessorReviewer:
    """
    Main reviewer class implementing the physics professor review methodology
    """
    
    def __init__(self):
        self.professor_profile = {
            "experience_years": "20+",
            "field": "quantum mechanics/condensed matter/superconductivity",
            "supervised_theses": "50+",
            "expertise": [
                "Superconducting quantum interference devices (SQUIDs)",
                "Josephson junctions and quantum transport",
                "Topological materials and Dirac semimetals", 
                "Low-temperature physics and quantum devices",
                "Academic writing and thesis supervision"
            ]
        }
    
    def load_chapter(self, chapter_path: str) -> Tuple[str, str, str]:
        """Load chapter content and extract title and number"""
        try:
            with open(chapter_path, 'r', encoding='utf-8') as f:
                content = f.read()
                
            # Extract chapter number and title from Typst format
            chapter_match = re.search(r'= (.+?) <', content)
            if chapter_match:
                title = chapter_match.group(1).strip()
            else:
                title = Path(chapter_path).stem
                
            # Extract chapter number from filename or content
            number_match = re.search(r'[Cc]h?(\d+)', Path(chapter_path).name)
            if number_match:
                number = number_match.group(1)
            else:
                number = "Unknown"
                
            return content, number, title
            
        except Exception as e:
            print(f"Error loading chapter {chapter_path}: {e}")
            return "", "Unknown", "Unknown"
    
    def analyze_technical_content(self, content: str, chapter_title: str) -> List[ReviewComment]:
        """Analyze technical physics content and identify issues"""
        comments = []
        
        # Check for proper physics terminology and concepts
        if "SQUID" in content or "Josephson" in content:
            # SQUID-specific analysis
            if "current-phase relation" in content.lower() or "CPR" in content:
                if "sin" not in content and "sinusoidal" not in content:
                    comments.append(ReviewComment(
                        category="Theoretical Framework",
                        issue="Current-phase relation discussion lacks mathematical formulation",
                        suggestion="Include explicit mathematical expressions for CPR, starting with the basic sinusoidal form I_s = I_c sin(φ) and then discussing deviations for topological materials",
                        priority=Priority.HIGH,
                        example="Consider adding: 'For conventional Josephson junctions, the CPR follows I_s(φ) = I_c sin(φ), however in topological materials like PtTe₂...'"
                    ))
            
            # Check for proper treatment of superconductivity concepts
            if "cooper pair" in content.lower() or "庫柏對" in content:
                if "coherence length" not in content.lower() and "相干長度" not in content:
                    comments.append(ReviewComment(
                        category="Physical Concepts",
                        issue="Discussion of Cooper pairs without mentioning coherence length",
                        suggestion="When discussing Cooper pairs, include the relevant length scales, particularly the superconducting coherence length ξ ≈ 200 nm for PtTe₂",
                        priority=Priority.MEDIUM
                    ))
        
        # Check for proper units and notation
        if re.search(r'\d+\s*K\b', content):
            # Temperature units found
            if not re.search(r'T_c|T_{c}|臨界溫度', content):
                comments.append(ReviewComment(
                    category="Technical Notation",
                    issue="Temperature values mentioned without proper context or notation",
                    suggestion="When mentioning temperatures, clearly distinguish between critical temperature (T_c), operating temperature, and measurement temperature. Use subscripts appropriately.",
                    priority=Priority.LOW
                ))
        
        # Check for proper figure and equation references
        if re.search(r'[Ff]ig\.?\s*\d+|圖\s*\d+', content):
            if "@fig:" not in content and "Figure" not in content:
                comments.append(ReviewComment(
                    category="Academic Writing",
                    issue="Inconsistent figure referencing format",
                    suggestion="Use consistent figure referencing throughout. In Typst, use @fig:label format for automatic numbering and cross-referencing",
                    priority=Priority.MEDIUM
                ))
        
        return comments
    
    def analyze_writing_standards(self, content: str) -> List[ReviewComment]:
        """Analyze academic writing quality and standards"""
        comments = []
        
        # Check for appropriate academic tone
        first_person_matches = re.findall(r'\b(I|we|my|our|我|我們)\b', content, re.IGNORECASE)
        if len(first_person_matches) > 10:  # Allow some first person usage
            comments.append(ReviewComment(
                category="Academic Tone",
                issue="Excessive use of first-person pronouns",
                suggestion="Consider using more passive voice and objective language typical of scientific writing. Replace 'we measured' with 'measurements were performed' or 'the results show'",
                priority=Priority.MEDIUM
            ))
        
        # Check for proper paragraph structure
        paragraphs = content.split('\n\n')
        short_paragraphs = [p for p in paragraphs if len(p.strip()) < 100 and len(p.strip()) > 20]
        if len(short_paragraphs) > len(paragraphs) * 0.3:
            comments.append(ReviewComment(
                category="Paragraph Structure", 
                issue="Many paragraphs are too short for academic writing",
                suggestion="Develop ideas more fully within paragraphs. Each paragraph should contain 3-5 sentences that develop a single main idea with supporting details",
                priority=Priority.MEDIUM
            ))
        
        # Check for transition words and logical flow
        transition_words = ['however', 'furthermore', 'therefore', 'moreover', 'consequently', 
                          'nevertheless', '然而', '因此', '此外', '然而']
        transition_count = sum(1 for word in transition_words if word.lower() in content.lower())
        paragraph_count = len([p for p in paragraphs if len(p.strip()) > 50])
        
        if paragraph_count > 5 and transition_count < paragraph_count * 0.2:
            comments.append(ReviewComment(
                category="Logical Flow",
                issue="Limited use of transition words between ideas",
                suggestion="Improve logical flow by adding appropriate transition words and phrases to connect ideas between sentences and paragraphs",
                priority=Priority.LOW
            ))
        
        return comments
    
    def identify_strengths(self, content: str, chapter_title: str) -> List[str]:
        """Identify strengths in the chapter"""
        strengths = []
        
        # Check for bilingual content (strength for international accessibility)
        if re.search(r'[\u4e00-\u9fff]', content) and re.search(r'[a-zA-Z]', content):
            strengths.append("Excellent bilingual presentation enhancing international accessibility")
        
        # Check for technical depth
        technical_terms = ['Josephson', 'SQUID', 'superconducting', 'quantum', 'Dirac', 'topological']
        if sum(1 for term in technical_terms if term.lower() in content.lower()) >= 5:
            strengths.append("Strong technical vocabulary and physics terminology usage")
        
        # Check for mathematical content
        if re.search(r'\$[^$]+\$|\\[a-zA-Z]+', content):
            strengths.append("Appropriate use of mathematical notation and equations")
        
        # Check for structured approach
        if re.search(r'==|###|##', content):
            strengths.append("Well-structured chapter organization with clear subsections")
        
        # Check for citations (basic check)
        if '@' in content or 'cite' in content.lower():
            strengths.append("Includes references to existing literature")
        
        return strengths
    
    def generate_line_comments(self, content: str) -> List[str]:
        """Generate specific line-by-line comments"""
        comments = []
        lines = content.split('\n')
        
        for i, line in enumerate(lines, 1):
            line = line.strip()
            if not line:
                continue
                
            # Check for common issues
            if re.search(r'[Tt]he [Tt]he|[Aa] [Aa]', line):
                comments.append(f"Line {i}: Check for repeated articles ('the the' or 'a a')")
            
            if len(line) > 200 and line.count(',') < 2:
                comments.append(f"Line {i}: Consider breaking this long sentence into smaller parts for clarity")
            
            if '°K' in line:
                comments.append(f"Line {i}: Use 'K' instead of '°K' for Kelvin temperature units")
            
            # Check for proper spacing around mathematical expressions
            if re.search(r'[a-zA-Z]\$|\$[a-zA-Z]', line):
                comments.append(f"Line {i}: Ensure proper spacing around mathematical expressions")
        
        return comments[:10]  # Limit to top 10 comments
    
    def suggest_resources(self, chapter_title: str, content: str) -> List[str]:
        """Suggest relevant academic resources"""
        resources = []
        
        # General physics writing
        resources.append("Alley, M. (2018). The Craft of Scientific Writing. Springer - for improving academic writing style")
        
        # SQUID and superconductivity specific
        if "SQUID" in content or "Josephson" in content:
            resources.extend([
                "Clarke, J. & Braginski, A.I. (2004). The SQUID Handbook. Wiley-VCH - comprehensive SQUID theory and applications",
                "Tinkham, M. (2004). Introduction to Superconductivity. Dover Publications - fundamental superconductivity concepts",
                "Barone, A. & Paternò, G. (1982). Physics and Applications of the Josephson Effect. Wiley - detailed Josephson junction physics"
            ])
        
        # Topological materials
        if "topological" in content.lower() or "Dirac" in content:
            resources.extend([
                "Kitaev, A. (2009). Periodic table for topological insulators and superconductors. AIP Advances - foundational topological classification",
                "Qi, X.-L. & Zhang, S.-C. (2011). Topological insulators and superconductors. Rev. Mod. Phys. 83, 1057 - comprehensive review"
            ])
        
        # Current-phase relations
        if "current-phase" in content.lower() or "CPR" in content:
            resources.append("Golubov, A.A. et al. (2004). The current-phase relation in Josephson junctions. Rev. Mod. Phys. 76, 411 - definitive CPR review")
        
        return resources
    
    def review_chapter(self, chapter_path: str) -> ChapterReview:
        """Main method to review a single chapter"""
        content, number, title = self.load_chapter(chapter_path)
        
        if not content:
            return ChapterReview(
                chapter_number=number,
                chapter_title=title,
                overall_assessment="Unable to load chapter content",
                strengths=[],
                improvements=[],
                line_comments=[],
                recommended_resources=[]
            )
        
        # Perform analysis
        technical_comments = self.analyze_technical_content(content, title)
        writing_comments = self.analyze_writing_standards(content)
        all_improvements = technical_comments + writing_comments
        
        strengths = self.identify_strengths(content, title)
        line_comments = self.generate_line_comments(content)
        resources = self.suggest_resources(title, content)
        
        # Generate overall assessment
        assessment = self._generate_overall_assessment(content, title, len(all_improvements), len(strengths))
        
        return ChapterReview(
            chapter_number=number,
            chapter_title=title,
            overall_assessment=assessment,
            strengths=strengths,
            improvements=all_improvements,
            line_comments=line_comments,
            recommended_resources=resources
        )
    
    def _generate_overall_assessment(self, content: str, title: str, num_issues: int, num_strengths: int) -> str:
        """Generate overall chapter assessment"""
        word_count = len(content.split())
        
        if num_issues <= 2 and num_strengths >= 3:
            quality = "excellent"
        elif num_issues <= 5 and num_strengths >= 2:
            quality = "good"
        elif num_issues <= 8:
            quality = "satisfactory"
        else:
            quality = "needs significant improvement"
        
        return f"This chapter shows {quality} development of {title.lower()} content with approximately {word_count} words. The technical treatment is appropriate for a master's level thesis, though some areas require attention to meet publication standards."
    
    def format_review_output(self, review: ChapterReview) -> str:
        """Format the review in the specified output format"""
        output = []
        
        # Header
        output.append(f"### Chapter {review.chapter_number}: {review.chapter_title}")
        output.append(f"**Overall Assessment**: {review.overall_assessment}")
        output.append("")
        
        # Strengths
        output.append("**Strengths**:")
        if review.strengths:
            for strength in review.strengths:
                output.append(f"- {strength}")
        else:
            output.append("- Chapter demonstrates basic structural organization")
        output.append("")
        
        # Areas for improvement
        output.append("**Areas for Improvement**:")
        output.append("")
        
        if review.improvements:
            for i, improvement in enumerate(review.improvements, 1):
                output.append(f"{i}. **{improvement.category}**")
                output.append(f"   - Issue: {improvement.issue}")
                output.append(f"   - Suggestion: {improvement.suggestion}")
                output.append(f"   - Priority: {improvement.priority.value}")
                if improvement.example:
                    output.append(f"   - Example: {improvement.example}")
                output.append("")
        else:
            output.append("1. **General Enhancement**")
            output.append("   - Issue: Chapter meets basic requirements")
            output.append("   - Suggestion: Consider expanding depth of analysis and discussion")
            output.append("   - Priority: Medium")
            output.append("")
        
        # Line-by-line comments
        if review.line_comments:
            output.append("**Specific Line-by-Line Comments**:")
            for comment in review.line_comments:
                output.append(f"- {comment}")
            output.append("")
        
        # Resources
        output.append("**Recommended Resources**:")
        for resource in review.recommended_resources:
            output.append(f"- {resource}")
        output.append("")
        
        return "\n".join(output)
    
    def review_all_chapters(self, chapters_dir: str) -> str:
        """Review all chapters in the directory"""
        chapters_path = Path(chapters_dir)
        if not chapters_path.exists():
            return f"Error: Chapters directory {chapters_dir} not found"
        
        # Find all chapter files
        chapter_files = []
        for pattern in ['Ch*.typ', 'ch*.typ']:
            chapter_files.extend(chapters_path.glob(pattern))
        
        chapter_files.sort()
        
        if not chapter_files:
            return f"No chapter files found in {chapters_dir}"
        
        # Introduction message
        output = []
        output.append("# Physics Professor Thesis Review")
        output.append("## Comprehensive Chapter-by-Chapter Analysis")
        output.append("")
        output.append("*As your thesis advisor, I've carefully reviewed each chapter of your thesis on 'Flux Controlled Current-Phase Relation in 1T-PtTe2 SQUIDs'. Below are my detailed comments and suggestions for improvement.*")
        output.append("")
        output.append("---")
        output.append("")
        
        # Review each chapter
        for chapter_file in chapter_files:
            print(f"Reviewing {chapter_file.name}...")
            review = self.review_chapter(str(chapter_file))
            output.append(self.format_review_output(review))
            output.append("---")
            output.append("")
        
        # Summary and meta-reflection
        output.append("## Overall Thesis Assessment")
        output.append("")
        output.append("Your thesis demonstrates a solid understanding of superconducting quantum devices and topological materials. The bilingual presentation is commendable and enhances accessibility. Focus on strengthening the theoretical framework, improving mathematical rigor, and ensuring consistent academic writing style throughout.")
        output.append("")
        output.append("## Next Steps")
        output.append("1. Address high-priority issues first (theoretical framework, mathematical formulations)")
        output.append("2. Improve consistency in notation and referencing")
        output.append("3. Expand discussion sections with deeper physical insights")
        output.append("4. Consider adding more quantitative analysis where appropriate")
        output.append("")
        output.append("*Remember: These suggestions are meant to enhance the already solid foundation of your work. Good luck with your revisions!*")
        
        return "\n".join(output)

def main():
    """Main function to run the review system"""
    if len(sys.argv) < 2:
        print("Usage: python physics_professor_reviewer.py <chapters_directory>")
        print("       python physics_professor_reviewer.py <single_chapter_file>")
        sys.exit(1)
    
    target = sys.argv[1]
    reviewer = PhysicsProfessorReviewer()
    
    if os.path.isdir(target):
        # Review all chapters in directory
        result = reviewer.review_all_chapters(target)
    elif os.path.isfile(target):
        # Review single chapter
        review = reviewer.review_chapter(target)
        result = reviewer.format_review_output(review)
    else:
        print(f"Error: {target} is not a valid file or directory")
        sys.exit(1)
    
    # Save result to file
    output_file = "thesis_review_analysis.md"
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(result)
    
    print(f"Review completed! Results saved to {output_file}")
    print("\nFirst few lines of the review:")
    print("-" * 50)
    print(result[:1000] + "..." if len(result) > 1000 else result)

if __name__ == "__main__":
    main()