terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.0.0-beta2"
    }
  }
  backend "s3" {
    bucket = "statefilelocking"
    key = "terraform_statefile"
    region = "ap-south-1"

    use_lockfile = true
  }
}


