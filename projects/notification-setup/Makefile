# Terraform commands for notification-setup (run once)

# Apply terraform with common vars only
apply:
	terraform apply -var-file="../../shared/common.tfvars" -auto-approve -backup=false

# Plan terraform with common vars only
plan:
	terraform plan -var-file="../../shared/common.tfvars"

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
	terraform state rm $$(terraform state list)

# Show output values (notification IDs)
output:
	terraform output

# Destroy infrastructure
destroy:
	terraform destroy -var-file="../../shared/common.tfvars" -auto-approve -backup=false

# Clean backup files
clean:
	find . -name "*.backup" -delete

# Run tflint with fix option
fix:
    tflint --init

lint:
    tflint --init
    tflint

.PHONY: apply plan init validate fmt state rm output destroy clean fix lint
