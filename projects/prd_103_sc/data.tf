# Remote state data sources for connection ID retrieval only
data "terraform_remote_state" "connection_setup" {
  backend = "local"
  config = {
    path = "../connection-setup/terraform.tfstate"
  }
}