export PATH := ./venv/bin:$(PATH)

.PHONY: init build clean.all

init: venv

venv:
	python -m venv venv
	pip install black mypy pylint setuptools twine wheel

build:
	python setup.py sdist bdist_wheel

publish.test: build
	twine upload --repository testpypi dist/*

publish: build
	twine upload dist/*

clean:
	rm -rf build dist

clean.all: clean
	rm -rf venv
