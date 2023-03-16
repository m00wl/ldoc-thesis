FIG_DIR = ./figures

.PHONY: thesis clean cleanall

thesis:
	make -C $(FIG_DIR) figures
	latexmk thesis.tex

clean:
	latexmk -C

cleanall: clean
	make -C $(FIG_DIR) clean
