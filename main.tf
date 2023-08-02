locals {
  qualia = ["157.7.206.73"]
  bulk   = ["157.7.202.115"]
}

# 46ki75.com
module "records_46ki75_com" {
  source    = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = "46ki75.com"

  records = [
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
        "google-site-verification=aR0pJV9ZdkMUbANgaKTpaXhuhPh5Y4-VfuQRURYJ-U8",
        "zoho-verification=zb28160163.zmverify.zoho.jp"
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
    # qualia A records --------------------
    {
      name    = ""
      type    = "A"
      ttl     = 3600
      records = local.qualia
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
      name    = "dev.amplify"
      type    = "A"
      ttl     = 300
      records = local.qualia
    },
    # bulk A records --------------------
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

}


# 46ki75.link
module "records_46ki75_link" {
  source    = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = "46ki75.link"

  records = [
    {
      name    = "_github-pages-challenge-46ki75"
      type    = "TXT"
      ttl     = 300
      records = ["bf36e1218e0252fe2cec73bb4184ec"]
    },
    {
      name    = ""
      type    = "A"
      ttl     = 3600
      records = ["185.199.108.153", "185.199.109.153", "185.199.110.153", "185.199.111.153"]
    },
    {
      name    = "www"
      type    = "CNAME"
      ttl     = 300
      records = ["46ki75.github.io"]
    }
  ]

}
