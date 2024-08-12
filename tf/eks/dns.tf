resource "aws_route53_record" "main" {
  for_each = toset(["A", "AAAA"])

  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.hostname
  type    = each.key

  alias {
    name                   = data.aws_alb.selected.dns_name
    zone_id                = data.aws_alb.selected.zone_id
    evaluate_target_health = false
  }
}

data "aws_route53_zone" "selected" {
  name = var.zone
}

data "aws_alb" "selected" {
  name = var.alb_name
}
