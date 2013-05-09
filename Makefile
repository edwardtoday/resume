SOURCENAME_CN ?= qingpei-cn
SOURCENAME_EN ?= qingpei-en

all:	en cn

spell:
	aspell check ${SOURCENAME_EN}.tex

en:
	latexmk -xelatex ${SOURCENAME_EN}.tex
	
cn:
	latexmk -xelatex ${SOURCENAME_CN}.tex

clean:
	latexmk -C

release:
	# git push origin ${GHBRANCH}




