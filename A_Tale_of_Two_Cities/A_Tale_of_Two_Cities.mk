BASENAME = A_Tale_of_Two_Cities
DOCTOC = /usr/share/doc/groff-*/html/mom/toc.html

ROFF = groff -mom
PS2PDF = ps2pdf -dPDFSETTINGS=/ebook
EDITOR = vim
LINKS = links

all: \
  $(BASENAME).pdf \
  #End

%.ps: %.gm
	$(ROFF) $< > $@

%.pdf: %.ps
	$(PS2PDF) $<

.PHONY: edit
edit:
	$(EDITOR) $(BASENAME)*.gm

.PHONY: readdoc
readdoc:
	$(LINKS) $(DOCTOC)

.SECONDARY:
clean:
	$(RM) $(BASENAME)*.ps
	$(RM) $(BASENAME)*.pdf

