module "acm" {
  source = "github.com/terraform-aws-modules/terraform-aws-acm.git?ref=v6.0.0"
  region = "us-east-1"

  domain_name               = var.base_domain
  zone_id                   = data.aws_route53_zone.this.zone_id
  validation_method         = "DNS"
  subject_alternative_names = ["*.${var.base_domain}"]
  wait_for_validation       = true
}
