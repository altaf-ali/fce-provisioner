.PHONY: all infrastructure ansible destroy

DICTIONARY := https://random-word-form.herokuapp.com/random

define generate_random_name
    $(shell curl -s $(DICTIONARY)/adjective | jq '.[0]')-$(shell curl -s $(DICTIONARY)/noun | jq '.[0]')
endef

all: ansible

ansible: infrastructure

ansible infrastructure:
	$(eval MACHINE_NAME=$(call generate_random_name))
	$(MAKE) -$(MAKEFLAGS) -C $@ MACHINE_NAME=$(MACHINE_NAME)

destroy:
	$(MAKE) -C infrastructure $@
