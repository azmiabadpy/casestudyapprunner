terraform {
  backend "s3" {
    bucket       = "casestudy-terraform-state-569103037896"
    key          = "apprunner/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}
