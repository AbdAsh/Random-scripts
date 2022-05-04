#!/bin/bash

# Get Files Count
total=$(ls -lR *.jpg | wc -l)
count=0

# Progress Bar
function ProgressBar {
    bar="${bar}="
    inc=$(echo "scale=3;$count/$total*100" | bc)
    echo -ne "> $bar $inc%\r"
}
# Loop through all files in the current folder and run OCR on them and save the result in a new docx file
for file in *.jpg; do
    count=$((count + 1))

    # Run the Progress Bar
    ProgressBar

    # run OCR on the file
    pytesseract "$file" >> output.txt
done

# Copy the result txt to a doc file
echo "Exporting to a doc file"
pandoc -f markdown+hard_line_breaks -t docx output.txt -o output.docx
echo "Done"

