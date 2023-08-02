terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "46ki75"
    workspaces {
      name = "terraform-aws-route53"
    }
  }
}
