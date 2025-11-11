include {
  path = find_in_parent_folders()
}

dependency "network" {
  config_path = "../network"
}

terraform {
  source = "git::https://github.com/The-A-Team-organization/iac_core.git//?ref=TAT-86-Create-Stage-Infrastructure-Terraform-Jenkins-ECR-SonarQube-IAM-Cross-Account-Policies"
}


inputs = {
  region            = local.region 
  vpc_id            = dependency.network.outputs.vpc_id
  igw_id            = dependency.network.outputs.igw_id
  availability_zone = "eu-central-1a"

  common_tags = local.common_tags

  sonarqube = {
    ami               = "ami-0a5b0d219e493191b"
    instance_type     = "c7i-flex.large"
    subnet_cidr       = "10.0.21.0/24"
  }

  ecr_repositories = ["frontend", "backend", "mailer_service", "scheduler_service"]
}

extra_arguments "targets_automated_phase" {
  commands = ["apply", "plan", "destroy"]
  arguments = [
    "-target=module.sonarqube",
    "-target=module.ecr"
  ]
}


