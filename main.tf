locals {
  qualia = ["157.7.205.92"]
  bulk   = ["157.7.202.115"]
}

# Route53のホストゾーンIDを取得
data "aws_route53_zone" "zone" {
  name         = "46ki75.com"
  private_zone = false
}

# MXレコード
resource "aws_route53_record" "mx_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "46ki75.com"
  type    = "MX"
  ttl     = 3600
  records = [
    "1 ASPMX.L.GOOGLE.COM",
    "5 ALT1.ASPMX.L.GOOGLE.COM",
    "5 ALT2.ASPMX.L.GOOGLE.COM",
    "10 ALT3.ASPMX.L.GOOGLE.COM",
    "10 ALT4.ASPMX.L.GOOGLE.COM"
  ]
}

# TXTレコード
resource "aws_route53_record" "txt_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "46ki75.com"
  type    = "TXT"
  ttl     = 3600
  records = [
    "v=spf1 include:_spf.google.com ~all",
    "google-site-verification=aR0pJV9ZdkMUbANgaKTpaXhuhPh5Y4-VfuQRURYJ-U8"
  ]
}

# 別のTXTレコード
resource "aws_route53_record" "txt_record_2" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "@"
  type    = "TXT"
  ttl     = 3600
  records = [
    "zoho-verification=zb87728988.zmverify.zoho.jp"
  ]
}

# DMARCレコード
resource "aws_route53_record" "dmarc_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "_dmarc.46ki75.com"
  type    = "TXT"
  ttl     = 300
  records = ["v=DMARC1; p=quarantine; rua=mailto:dmarc-reports@46ki75.com"]
}

# DKIMレコード
resource "aws_route53_record" "dkim_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "google._domainkey.46ki75.com"
  type    = "TXT"
  ttl     = 300
  records = [
    "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC3jhN4rcZjLxJbUVqrpX8gBCU6G9QCPp3njHO1ehI3WKNz9gTdu/dM6rtZP2aep5zKNHf3OHPD5vF2r6WvoOIha+WWHZTri26n1eIzFGYgUM8FK6dSC/38kHd0YcRyJhW3vnKKB7zGFvOy1BmwPs/tS4+uTM+ImYcPJwEVOZdJ5QIDAQAB"
  ]
}

# MTA-STSレコード
resource "aws_route53_record" "mta_sts_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "_mta-sts.46ki75.com"
  type    = "TXT"
  ttl     = 300
  records = ["v=STSv1; id=20190425085700"]
}

# TLSRPTレコード
resource "aws_route53_record" "tlsrpt_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "_smtp.46ki75.com"
  type    = "TXT"
  ttl     = 300
  records = ["v=TLSRPTv1; rua=mailto:tls-rpt@46ki75.com"]
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
