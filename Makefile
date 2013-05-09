SOURCENAME_CN ?= qingpei-cn
SOURCENAME_EN ?= qingpei-en
PDFDIR ?= pdf
HTMLDIR ?= html
TEXCOMMAND ?= latexmk -xelatex -bibtex -outdir=${PDFDIR} -time
GENHTML ?= pdf2htmlEX --fit-width 900 --single-html 1 --dest-dir ${HTMLDIR} --font-size-multiplier 100 --process-outline 0

all:	en cn html clean

spell:
	aspell check ${SOURCENAME_EN}.tex

en:
	${TEXCOMMAND} ${SOURCENAME_EN}.tex
	
cn:
	${TEXCOMMAND} ${SOURCENAME_CN}.tex

html: 
	${GENHTML} ${PDFDIR}/${SOURCENAME_EN}.pdf
	${GENHTML} ${PDFDIR}/${SOURCENAME_CN}.pdf

clean:
	${TEXCOMMAND} -c

release:
	# git push origin ${GHBRANCH}
