
include {
  path = find_in_parent_folders("root.hcl")
}


remote_state {
  backend = "s3"
  config = {
    region       = "eu-central-1"
    bucket       = "team-a-tf-state-stage"
    key          = "stage/jenkins/terraform.tfstate"
    encrypt      = true
    use_lockfile = true
  }
}


inputs = {
  enable_jenkins     = true
  jenkins_role_name  = "jenkins_role_stage"
  role_arn           = "arn:aws:iam::165015980393:role/TerraformRoleStage"
}
