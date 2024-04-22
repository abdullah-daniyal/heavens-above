#!/bin/bash

OUTPUT_FILE="RELEASE_NOTES.md"
LAST_RELEASE_TAG=$(git describe --tags --abbrev=0)
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Generate release notes
echo "Release Notes" > $OUTPUT_FILE
echo "=============" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE
echo "Changes since $LAST_RELEASE_TAG" >> $OUTPUT_FILE
echo "-----------------------------" >> $OUTPUT_FILE
git log --oneline $LAST_RELEASE_TAG..$CURRENT_BRANCH >> $OUTPUT_FILE

echo "Release notes generated: $OUTPUT_FILE"
