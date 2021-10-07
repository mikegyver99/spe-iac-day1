terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "michael_garcia_spesonycom"
    workspaces {
      name = "tfc-s3-priv-module-lab-mgarcia16-day2"
    }
  }
}
