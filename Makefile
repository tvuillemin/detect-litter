export PATH := ./venv/bin:$(PATH)

init: venv

venv:
	python -m venv venv
	pip install black mypy pylint setuptools twine wheel

clean.all:
	rm -rf venv
