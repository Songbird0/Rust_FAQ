#!/bin/bash

echo "Génération du document Markdown en pdf."
if [ -f rust_FAQ_PDF/rust_FAQ.pdf ]
then
  echo "Le document rust_FAQ.pdf existe déjà, suppression..."
  rm rust_FAQ_PDF/rust_FAQ.pdf
fi
pandoc rust_FAQ_Markdown/rust_FAQ.md --latex-engine=xelatex -s -o rust_FAQ_PDF/rust_FAQ.pdf
echo "Génération terminée."
