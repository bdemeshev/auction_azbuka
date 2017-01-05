# makefile: tex -> pdf via xelatex
# v 2.0
# .tex extension is automatically added
file_name = auct

$(file_name).pdf: $(file_name).tex lecture1.tex lecture2.tex lecture3.tex lecture4.tex solut1.tex solut2.tex solut3.tex solut4.tex title_bor_utf8.tex dogon_text.tex auc_ht3_solut.tex auc_problems.tex opit.bib
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
