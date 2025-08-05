#!/bin/bash

# Physics Professor Thesis Review System
# Wrapper script for easy usage

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REVIEWER_SCRIPT="$SCRIPT_DIR/physics_professor_reviewer.py"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_header() {
    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}   Physics Professor Thesis Review System${NC}"
    echo -e "${BLUE}================================================${NC}"
    echo ""
}

print_usage() {
    echo -e "${YELLOW}Usage:${NC}"
    echo "  $0 [directory|file]"
    echo ""
    echo -e "${YELLOW}Examples:${NC}"
    echo "  $0 chapters/                    # Review all chapters"
    echo "  $0 chapters/Ch1-introduction.typ # Review single chapter"
    echo ""
    echo -e "${YELLOW}Output:${NC}"
    echo "  Results will be saved to thesis_review_analysis.md"
    echo ""
}

# Check if Python3 is available
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Error: Python 3 is required but not installed.${NC}"
    exit 1
fi

# Check if the reviewer script exists
if [ ! -f "$REVIEWER_SCRIPT" ]; then
    echo -e "${RED}Error: physics_professor_reviewer.py not found in $SCRIPT_DIR${NC}"
    exit 1
fi

print_header

# Check arguments
if [ $# -eq 0 ]; then
    echo -e "${RED}Error: No target specified${NC}"
    echo ""
    print_usage
    exit 1
fi

TARGET="$1"

# Check if target exists
if [ ! -e "$TARGET" ]; then
    echo -e "${RED}Error: Target '$TARGET' does not exist${NC}"
    exit 1
fi

# Determine what we're reviewing
if [ -d "$TARGET" ]; then
    echo -e "${GREEN}📚 Reviewing all chapters in directory: $TARGET${NC}"
    REVIEW_TYPE="directory"
elif [ -f "$TARGET" ]; then
    echo -e "${GREEN}📖 Reviewing single chapter: $TARGET${NC}"
    REVIEW_TYPE="file"
else
    echo -e "${RED}Error: '$TARGET' is neither a file nor a directory${NC}"
    exit 1
fi

echo ""
echo -e "${YELLOW}🤖 Starting Physics Professor AI Review...${NC}"
echo ""

# Run the reviewer
if python3 "$REVIEWER_SCRIPT" "$TARGET"; then
    echo ""
    echo -e "${GREEN}✅ Review completed successfully!${NC}"
    echo ""
    echo -e "${BLUE}📄 Results saved to: thesis_review_analysis.md${NC}"
    echo ""
    
    # Show file size
    if [ -f "thesis_review_analysis.md" ]; then
        FILE_SIZE=$(wc -l < thesis_review_analysis.md)
        echo -e "${BLUE}📊 Review contains $FILE_SIZE lines of detailed feedback${NC}"
    fi
    
    echo ""
    echo -e "${YELLOW}💡 Next steps:${NC}"
    echo "1. Read the detailed review in thesis_review_analysis.md"
    echo "2. Address high-priority issues first"
    echo "3. Use recommended resources for further improvement"
    echo "4. Re-run the review after making changes"
    echo ""
else
    echo ""
    echo -e "${RED}❌ Review failed. Please check the error messages above.${NC}"
    exit 1
fi