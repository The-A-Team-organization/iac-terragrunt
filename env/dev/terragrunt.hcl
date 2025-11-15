include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "https://github.com/The-A-Team-organization/iac_account_setup.git//modules?ref=TAT-87_Implement_account_setup_infrastructure_via_terraform"
}

remote_state {
  backend = "s3"
  config = {
    bucket       = "team-a-tf-state-dev"
    key          = "dev/terraform.tfstate"
    region       = "eu-central-1"
    encrypt      = true
    use_lockfile = true
  }
}

inputs = {
  aws_region = "eu-central-1"

  ami_id     = "ami-0a5b0d219e493191b"
  enable_consul = true
  enable_iam_ssm = true
  enable_lb = true
  enable_web = true
  enable_db = true
  role_arn = get_env("ROLE_ARN")
}
