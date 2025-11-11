locals {
  region = "eu-central-1"

  common_tags = {
    CreatedBy   = "Terragrunt"
    Project     = "Illuminati"
  }

}

dependency "backend" {
  config_path = ""
}

remote_state {
  backend = "s3"
  config = {
    bucket         = dependency.backend.outputs.backend_bucket
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region
    encrypt        = true
  }
}

generate "provider" {
  path      = "providers.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region = "${local.region}"
}
EOF
}


