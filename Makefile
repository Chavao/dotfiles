.PHONY: setup dependencies install

setup: dependencies install

dependencies:
	pip install -r setup/requirements.txt

install:
	python setup/installer.py
