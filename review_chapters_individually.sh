#!/bin/bash

# Physics Professor Individual Chapter Review System
# Wrapper script for reviewing chapters separately

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REVIEWER_SCRIPT="$SCRIPT_DIR/review_chapters_separately.py"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

print_header() {
    echo -e "${BLUE}======================================================${NC}"
    echo -e "${BLUE}   Physics Professor Individual Chapter Review       ${NC}"
    echo -e "${BLUE}======================================================${NC}"
    echo ""
}

print_usage() {
    echo -e "${YELLOW}Usage:${NC}"
    echo "  $0 [directory]"
    echo ""
    echo -e "${YELLOW}Examples:${NC}"
    echo "  $0 chapters/                    # Review all chapters separately"
    echo ""
    echo -e "${YELLOW}Output:${NC}"
    echo "  Individual review files will be saved in 'review/' directory"
    echo "  Each chapter gets its own dedicated review file"
    echo ""
}

# Check if Python3 is available
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Error: Python 3 is required but not installed.${NC}"
    exit 1
fi

# Check if the reviewer script exists
if [ ! -f "$REVIEWER_SCRIPT" ]; then
    echo -e "${RED}Error: review_chapters_separately.py not found in $SCRIPT_DIR${NC}"
    exit 1
fi

print_header

# Check arguments
if [ $# -eq 0 ]; then
    echo -e "${RED}Error: No chapters directory specified${NC}"
    echo ""
    print_usage
    exit 1
fi

TARGET="$1"

# Check if target exists and is a directory
if [ ! -d "$TARGET" ]; then
    echo -e "${RED}Error: '$TARGET' is not a valid directory${NC}"
    exit 1
fi

echo -e "${GREEN}📚 Reviewing all chapters individually in directory: $TARGET${NC}"
echo ""
echo -e "${YELLOW}🤖 Starting Individual Chapter Reviews...${NC}"
echo ""

# Run the reviewer
if python3 "$REVIEWER_SCRIPT" "$TARGET"; then
    echo ""
    echo -e "${GREEN}✅ All individual chapter reviews completed successfully!${NC}"
    echo ""
    
    # Count files in review directory
    if [ -d "review" ]; then
        REVIEW_COUNT=$(find review -name "review_*.md" | wc -l)
        TOTAL_LINES=$(find review -name "review_*.md" -exec wc -l {} + | tail -1 | awk '{print $1}')
        
        echo -e "${BLUE}📊 Review Statistics:${NC}"
        echo -e "${CYAN}   • $REVIEW_COUNT individual chapter reviews created${NC}"
        echo -e "${CYAN}   • $TOTAL_LINES total lines of detailed feedback${NC}"
        echo -e "${CYAN}   • Reviews saved in 'review/' directory${NC}"
        echo -e "${CYAN}   • Index file: review/README.md${NC}"
        echo ""
        
        echo -e "${BLUE}📁 Individual Review Files:${NC}"
        find review -name "review_*.md" | sort | while read file; do
            basename=$(basename "$file")
            lines=$(wc -l < "$file")
            echo -e "${CYAN}   • $basename ($lines lines)${NC}"
        done
        echo ""
    fi
    
    echo -e "${YELLOW}💡 Next steps:${NC}"
    echo "1. Navigate to the 'review/' directory"
    echo "2. Read individual chapter reviews (each file is self-contained)"
    echo "3. Use the README.md file as an index to all reviews"
    echo "4. Address high-priority issues in each chapter"
    echo "5. Use recommended resources for targeted improvement"
    echo ""
    echo -e "${GREEN}🎯 Benefits of individual reviews:${NC}"
    echo "• Focus on one chapter at a time"
    echo "• Easier navigation and reference"
    echo "• Chapter-specific feedback and resources"
    echo "• Independent review files for sharing"
    echo ""

else
    echo ""
    echo -e "${RED}❌ Individual chapter review failed. Check error messages above.${NC}"
    exit 1
fi