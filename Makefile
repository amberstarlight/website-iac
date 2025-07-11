#!/usr/bin/make

.PHONY: init
init:
	tofu init

.PHONY: format
format:
	tofu fmt -check

.PHONY: validate
validate: init format
	tofu validate

.PHONY: plan
plan: validate
	tofu plan -out=tfplan

.PHONY: apply
apply: validate
	tofu apply

.PHONY: deploy
deploy: validate
	tofu apply --auto-approve

.PHONY: destroy
destroy: init
	tofu destroy

.PHONY: checkov
checkov:
	LOG_LEVEL=ERROR checkov -d . --quiet --skip-check CKV_TF_2 --framework terraform
