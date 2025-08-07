# Terraform commands for prd_103_sc

# Apply terraform with common var file only
apply:
	terraform apply -var-file="../../shared/common.tfvars" -auto-approve -backup=false -lock=false

# Plan terraform with common var file only
plan:
	terraform plan -var-file="../../shared/common.tfvars" -lock=false

# Initialize terraform
init:
	terraform init

# Validate terraform configuration
validate:
	terraform validate

# Format terraform files
fmt:
	terraform fmt -recursive

# List terraform state resources
state:
	terraform state list

# Remove all resources from state
rm:
	terraform state rm -lock=false $$(terraform state list)

# Show output values
output:
	terraform output

# Destroy infrastructure
destroy:
	terraform destroy -var-file="../../shared/common.tfvars" -auto-approve -backup=false -lock=false

# Clean backup files
clean:
	find . -name "*.backup" -delete

.PHONY: apply plan init validate fmt state rm destroy clean

