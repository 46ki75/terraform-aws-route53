locals {
  qualia = ["157.7.205.92"]
  bulk   = ["157.7.202.115"]
}

# Route53のホストゾーンIDを取得
data "aws_route53_zone" "zone" {
  name         = "46ki75.com"
  private_zone = false
}

# zoho
# MX
resource "aws_route53_record" "mx_records" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "46ki75.com"
  type    = "MX"
  ttl     = 300
  records = [
    "10 mx.zoho.jp",
    "20 mx2.zoho.jp",
    "50 mx3.zoho.jp",
  ]
}

# DKIM
resource "aws_route53_record" "dkim_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "zmail._domainkey.46ki75.com"
  type    = "TXT"
  ttl     = 300
  records = ["v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBoQakPERf1XiC2y+zguQOJieh2mBhW75Wzob3mFuKBrRAmOoI/zCzr6xFOpqUa7rOKc1r2A6O/K30GUEJMbiRRMXrN4b1/rkoheOAIJqTQPPaJGD1ocyH0ekrMwHXPuJbr3dkBxSGVn5R++9y18ZbyoNMK7Tpx6ZNF9LWEgKn/wIDAQAB"]
}

# TXT (spf, verify)
resource "aws_route53_record" "txt_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "46ki75.com"
  type    = "TXT"
  ttl     = 3600
  records = [
    "v=spf1 include:zoho.jp ~all",
    "zoho-verification=zb87728988.zmverify.zoho.jp"
  ]
}

# qualia Aレコード
resource "aws_route53_record" "qualia_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "qualia.46ki75.com"
  type    = "A"
  ttl     = 300
  records = local.qualia
}

# bulk Aレコード
resource "aws_route53_record" "bulk_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "bulk.46ki75.com"
  type    = "A"
  ttl     = 300
  records = local.bulk
}

# minecraft Aレコード
resource "aws_route53_record" "minecraft_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "minecraft.46ki75.com"
  type    = "A"
  ttl     = 300
  records = local.bulk
}

# map Aレコード
resource "aws_route53_record" "map_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "map.46ki75.com"
  type    = "A"
  ttl     = 300
  records = local.bulk
}

# GitHub Pagesチャレンジレコード
resource "aws_route53_record" "github_challenge_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "_github-pages-challenge-46ki75.46ki75.com"
  type    = "TXT"
  ttl     = 300
  records = ["3934751b91183b4dccdfaf12974966"]
}

# GitHub Pages CNAMEレコード (docs)
resource "aws_route53_record" "github_pages_docs_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "docs.46ki75.com"
  type    = "CNAME"
  ttl     = 300
  records = ["46ki75.github.io"]
}

# GitHub Pages CNAMEレコード (internal)
resource "aws_route53_record" "vercel_internal_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "internal.46ki75.com"
  type    = "CNAME"
  ttl     = 300
  records = ["cname.vercel-dns.com"]
}
