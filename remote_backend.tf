terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "YOUR-TFCP-ORGANIZATION"
    workspaces {
      name = "UNIQUE-WORKSPACE-NAME"
    }
  }
}
