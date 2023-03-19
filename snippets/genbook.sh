#!/bin/bash

FILES=$(find src/ -name *.md | sort -n)
DATE=$(date +'%F')
BRANCH=$(git branch --show-current)
FILENAME="Resume-FirstName-LastName-$DATE-$BRANCH.pdf"
function _combine_md() {
	mkdir -p output
	pandoc $FILES -o output/merged-$DATE.md

}

function _combine_pdf() {
	mkdir -p output
	pandoc $FILES -o output/$FILENAME --pdf-engine xelatex

}


_combine_md
_combine_pdf

echo "$FILENAME"

