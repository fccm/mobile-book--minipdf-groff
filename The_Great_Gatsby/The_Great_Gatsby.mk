BASENAME = The_Great_Gatsby
DOCTOC = /usr/share/doc/groff*/html/mom/toc.html

ROFF = groff -mom
PS2PDF = ps2pdf -dPDFSETTINGS=/ebook
EDITOR = vim
WEBBROWSER = links

all: \
  $(BASENAME)-1.pdf \
  $(BASENAME)-2.pdf \
  $(BASENAME)-3.pdf \
  $(BASENAME)-4.pdf \
  $(BASENAME)-5.pdf \
  $(BASENAME)-6.pdf \
  $(BASENAME)-7.pdf \
  $(BASENAME)-8.pdf \
  $(BASENAME)-9.pdf \
  #End

%.ps: %.gm
	$(ROFF) $< > $@

%.pdf: %.ps
	$(PS2PDF) $<

.PHONY: edit
edit:
	$(EDITOR) $(BASENAME)-[123456789].gm

.PHONY: readdoc
readdoc:
	$(WEBBROWSER) $(DOCTOC)

.SECONDARY:
clean:
	$(RM) $(BASENAME)-[123456789].ps
	$(RM) $(BASENAME)-[123456789].pdf

