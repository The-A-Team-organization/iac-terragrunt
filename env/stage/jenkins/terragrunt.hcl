include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git@github.com:The-A-Team-organization/iac_account_setup.git//modules?ref=TAT-87_Implement_account_setup_infrastructure_via_terraform"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "team-a-tf-state-stage"
    key            = "stage/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    use_lockfile   = true
    # profile      = "stage"
  }
}

inputs = {
  aws_region = "eu-central-1"
  # profile    = "stage"
  ami_id     = "ami-0a5b0d219e493191b"
  enable_jenkins = true
  jenkins_role_name = "jenkins_role_stage"
}
