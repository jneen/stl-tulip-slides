SIZE ?= 4x3
NOTES ?= notes.txt
SLIDES ?= $(SIZE)/*/*
SLIDES_VIM ?= vim
VIM_OPTS = -S ./vim/init.vim
VIM_E = SLIDES_DIR=$(SIZE) $(SLIDES_VIM) $(VIM_OPTS)

.PHONY: edit
edit:
	$(VIM_E) $(SLIDES) +'vs notes.txt | wincmd h'

.PHONY: run
run:
	$(VIM_E) $(SLIDES)

.PHONY: run-g
run-g:
	$(GVIM_E) $(SLIDES)
