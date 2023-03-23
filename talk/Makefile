FIG_DIR = ./figures

.PHONY: talk clean cleanall

talk:
	make -C $(FIG_DIR) figures
	latexmk talk.tex

clean:
	latexmk -C

cleanall: clean
	make -C $(FIG_DIR) clean
