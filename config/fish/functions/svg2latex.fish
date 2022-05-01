function svg2latex;
	/usr/bin/inkscape -D -z --file="$argv[1]" --export-pdf="$argv[2]" --export-latex;
end