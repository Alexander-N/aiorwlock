# Some simple testing tasks (sorry, UNIX only).

FLAGS=


flake:
	flake8 aiorwlock tests

test: flake
	nosetests -s $(FLAGS) ./tests/

vtest:
	nosetests -s -v $(FLAGS) ./tests/

cov cover coverage: flake
	nosetests -s -v --with-cover --cover-html --cover-branches $(FLAGS) --cover-package aiorwlock ./tests/
	@echo "open file://`pwd`/cover/index.html"

clean:
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -f `find . -type f -name '@*' `
	rm -f `find . -type f -name '#*#' `
	rm -f `find . -type f -name '*.orig' `
	rm -f `find . -type f -name '*.rej' `
	rm -f .coverage
	rm -rf coverage
	rm -rf build
	rm -rf cover
	rm -rf dist

doc:
	make -C docs html
	@echo "open file://`pwd`/docs/_build/html/index.html"

.PHONY: all flake test vtest cov clean doc
