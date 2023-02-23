.PHONY: all

ANSIBLE = ansible-playbook

ENTRY_SRC = main.yml
INVENTORY = ../infrastructure/inventory
SOURCES = $(shell find roles -type f)

all: $(ENTRY_SRC) $(SOURCES) $(INVENTORY)
	$(ANSIBLE) $(ENTRY_SRC) \
               -v \
               --timeout 120 \
	           -i "$(INVENTORY)" \
	           -e "ansible_python_interpreter=/usr/bin/python3"


$(INVENTORY):
	@echo "Ansible inventory does not exist; create the infrastructure first"
	@exit 1

