SIZE ?= 16x9
NOTES ?= notes.txt
SLIDES ?= $(SIZE)/*/*
VIM ?= nvim
GVIM ?= gvim
VIM_OPTS = -S ./vim/init.vim
VIM_E = SLIDES_DIR=$(SIZE) $(VIM) $(VIM_OPTS)
GVIM_E = $(GVIM) $(VIM_OPTS)

.PHONY: edit
edit:
	$(VIM_E) $(SLIDES) +'vs notes.txt | wincmd h'

.PHONY: run
run:
	$(VIM_E) $(SLIDES)

.PHONY: run-g
run-g:
	$(GVIM_E) $(SLIDES)
