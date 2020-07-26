.PHONY: setup dependencies install

setup: dependencies install

dependencies:
	@pip install -r setup/requirements.txt > /dev/null

install:
	@python setup/installer.py
