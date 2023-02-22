.PHONY: all apply destroy clean

TERRAFORM = terraform
TERRAFORM_INIT = .terraform
TERRAFORM_STATE = $(wildcard *.tfstate*)

SOURCES = $(shell find . -type f -name "*.tf")

all: $(SOURCES) $(TERRAFORM_INIT) apply

apply destroy:
	$(TERRAFORM) $@ -auto-approve -var "username=$$(whoami)" -var "machine-name=$(MACHINE_NAME)"

$(TERRAFORM_INIT):
	$(TERRAFORM) init

clean:
	rm -rf $(TERRAFORM_INIT) $(TERRAFORM_STATE)
