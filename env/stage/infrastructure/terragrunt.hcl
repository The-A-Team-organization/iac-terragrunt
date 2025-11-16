
include {
  path = find_in_parent_folders("root.hcl")
}


remote_state {
  backend = "s3"
  config = {
    region       = "eu-central-1"
    bucket       = "team-a-tf-state-stage"
    key          = "stage/infrastructure/terraform.tfstate"
    encrypt      = true
    use_lockfile = true
  }
}


inputs = {
  enable_consul  = true
  role_arn       = get_env("ROLE_ARN")
}
