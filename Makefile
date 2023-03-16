THESIS_DIR = ./thesis
TALK_DIR   = ./talk

.PHONY: thesis talk cleanall

thesis:
	make -C $(THESIS_DIR) thesis

talk:
	make -C $(TALK_DIR) talk

cleanall:
	make -C $(THESIS_DIR) cleanall
	make -C $(TALK_DIR) cleanall
