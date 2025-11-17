
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
  environment_name        = "stage"

  # enable_consul  = true
  # enable_iam_ssm = true
  # enable_lb = true
  # enable_web = true
  # enable_db = true
  # env = "stage"
  # available_zone = "eu-central-1a"
  # birdwatching_dns_name = "birdwatching.pp.ua"



  cluster_availability_zone_1 = "eu-central-1a"
  cluster_availability_zone_2 = "eu-central-1b"
  private_subnet_cidr_block_1 = "10.0.8.0/24"
  private_subnet_cidr_block_2 = "10.0.9.0/24"
  public_subnet_cidr_block_2  = "10.0.10.0/24"
  public_subnet_cidr_block_1  = "10.0.11.0/24"

  min_size     = 1
  max_size     = 5
  desired_size = 1

  eks_cluster_name        = "illuminati_app_cluster"
  eks_cluster_k8s_version = "1.34"

  node_instance_types = ["t3.small"]
  vpc_id = "vpc-091a95a2989e844df"
  public_route_table_id = "rtb-0665da5efb1bef3b4"
}
