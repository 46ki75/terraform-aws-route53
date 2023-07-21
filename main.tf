locals {
  qualia = ["157.7.206.73"]
  bulk   = ["157.7.202.115"]
}

module "zones" {
  source = "./modules/route53/zones"

  zones = {
    "46ki75.com" = {
      comment = "created by Terraform"
      tags = {
        Name = "46ki75.com"
      }
    }
  }

  tags = {
    ManagedBy = "Terraform"
  }
}

# 46ki75.com
module "records" {
  source = "./modules/route53/records"
  zone_name = "46ki75.com"

  records = [
    {
      name = ""
      type = "A"
      ttl  = 3600
      records = [
        "157.7.206.73",
      ]
    },
    {
      name = ""
      type = "MX"
      ttl  = 3600
      records = [
        "1 ASPMX.L.GOOGLE.COM",
        "5 ALT1.ASPMX.L.GOOGLE.COM",
        "5 ALT2.ASPMX.L.GOOGLE.COM",
        "10 ALT3.ASPMX.L.GOOGLE.COM",
        "10 ALT4.ASPMX.L.GOOGLE.COM"
      ]
    },
    {
      name = ""
      type = "TXT"
      ttl  = 3600
      records = [
        "v=spf1 include:_spf.google.com ~all",
        "google-site-verification=aR0pJV9ZdkMUbANgaKTpaXhuhPh5Y4-VfuQRURYJ-U8"
      ]
    },
    {
      name    = "_dmarc"
      type    = "TXT"
      ttl     = 300
      records = ["v=DMARC1; p=quarantine; rua=mailto:dmarc-reports@46ki75.com"]
    },
    {
      name = "google._domainkey.46ki75.com"
      type = "TXT"
      ttl  = 300
      records = [
        "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC3jhN4rcZjLxJbUVqrpX8gBCU6G9QCPp3njHO1ehI3WKNz9gTdu/dM6rtZP2aep5zKNHf3OHPD5vF2r6WvoOIha+WWHZTri26n1eIzFGYgUM8FK6dSC/38kHd0YcRyJhW3vnKKB7zGFvOy1BmwPs/tS4+uTM+ImYcPJwEVOZdJ5QIDAQAB"
      ]
    },
    {
      name    = "_mta-sts"
      type    = "TXT"
      ttl     = 300
      records = ["v=STSv1; id=20190425085700"]
    },
    {
      name    = "_smtp"
      type    = "TXT"
      ttl     = 300
      records = ["v=TLSRPTv1; rua=mailto:tls-rpt@46ki75.com"]
    },
    {
      name    = "admin"
      type    = "A"
      ttl     = 300
      records = local.qualia
    },
    {
      name    = "angular"
      type    = "A"
      ttl     = 300
      records = local.qualia
    },
    {
      name    = "imgtools"
      type    = "A"
      ttl     = 300
      records = local.qualia
    },
    {
      name    = "phpmyadmin"
      type    = "A"
      ttl     = 300
      records = local.qualia
    },
    {
      name    = "www"
      type    = "A"
      ttl     = 300
      records = local.qualia
    },
    {
      name    = "admin.www"
      type    = "A"
      ttl     = 300
      records = local.qualia
    },
    {
      name    = "bulk"
      type    = "A"
      ttl     = 300
      records = local.bulk
    },
    {
      name    = "minecraft"
      type    = "A"
      ttl     = 300
      records = local.bulk
    },
    {
      name    = "dynmap"
      type    = "A"
      ttl     = 300
      records = local.bulk
    }
  ]

  depends_on = [module.zones]
}
