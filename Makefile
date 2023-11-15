.PHONY: setup dependencies install dump-tilix-dconf

setup: dependencies install

dependencies:
	@pip install -r setup/requirements.txt > /dev/null

install:
	@python setup/installer.py

dump-tilix-dconf:
	@dconf dump /com/gexperts/Tilix/ > $(HOME)/dotfiles/settings/tilix/tilix.dconf