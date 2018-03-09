
all: intro_to_bayes.html intro_to_bayes.pdf

%.png: figures.R
	Rscript figures.R
xb
intro_to_bayes.html: intro_to_bayes.md
	pandoc -t revealjs -s -o $@ $< -V revealjs-url=http://lab.hakim.se/reveal-js -V theme=blackm --slide-level=2

intro_to_bayes.pdf: intro_to_bayes.md
	pandoc -s -t beamer $< -o $@ -V theme=metropolis --slide-level=2

clean:
	rm *.pdf *.html
