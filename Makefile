SOURCENAME_CN ?= qingpei-cn
SOURCENAME_EN ?= qingpei-en
PDFDIR ?= pdf
HTMLDIR ?= html
TEXCOMMAND ?= latexmk -xelatex -bibtex -outdir=${PDFDIR} -time
# GENHTML ?= pdf2htmlEX --fit-width 900 --embed CFIJO --dest-dir ${HTMLDIR} --font-size-multiplier 100 --process-outline 0

all:	en cn clean

spell:
	aspell check ${SOURCENAME_EN}.tex

en:
	${TEXCOMMAND} ${SOURCENAME_EN}.tex

cn:
	${TEXCOMMAND} ${SOURCENAME_CN}.tex

#TODO pdf2htmlEX outputs are too large. some new way must be explorered to gen html
# html:
	# ${GENHTML} ${PDFDIR}/${SOURCENAME_EN}.pdf
	# ${GENHTML} ${PDFDIR}/${SOURCENAME_CN}.pdf

clean:
	${TEXCOMMAND} -c
	rm pdf/*.xdv

release:
	# git push origin ${GHBRANCH}
