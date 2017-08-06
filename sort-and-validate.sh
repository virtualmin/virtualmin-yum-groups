#!/bin/sh
# Run this to validate and sort all xml files
# Depends on pungi package and xsltproc

for i in *.xml; do
	xsltproc --novalid -o "$i.sorted" /usr/share/pungi/comps-cleanup.xsl $i
	mv $i.sorted $i
done

