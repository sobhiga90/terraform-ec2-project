terraform {
  backend "s3" {
    bucket       = "sobhi-terraform-state-bucket"
    key          = "ec2-project/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}