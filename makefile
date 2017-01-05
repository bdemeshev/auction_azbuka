# makefile: tex -> pdf via xelatex
# v 2.0
# .tex extension is automatically added
file_name = auct

$(file_name).pdf: $(file_name).tex lecture_01.tex lecture_02.tex lecture_03.tex lecture_04.tex kr_01.tex kr_02.tex kr_03.tex kr_04.tex kr_01_solution.tex kr_02_solution.tex kr_03_solution.tex kr_04_solution.tex title_bor_utf8.tex kr_dogon.tex kr_dogon_solution.tex kr_03_takehome.tex kr_03_takehome_solution.tex more_problems.tex opit.bib
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	latexmk -xelatex $(file_name).tex

	# clean auxillary files
	latexmk -c $(file_name).tex

# $(file_name).tex : $(file_name).Rnw
#	Rscript -e "library(knitr); knit('$(file_name).Rnw')"

clean:
	-rm $(file_name).pdf $(file_name).aux $(file_name).log $(file_name).fls $(file_name).fdb_latexmk $(file_name).idx $(file_name).out $(file_name).pre $(file_name).toc $(file_name).s.gnuplot $(file_name).pgf-plot.gnuplot $(file_name).ilg $(file_name).ind
