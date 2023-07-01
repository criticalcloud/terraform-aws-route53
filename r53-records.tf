data "aws_route53_zone" "selected" {
  count        = length(var.standalone_records)
  name         = var.standalone_records[count.index].zone
  private_zone = true
}

resource "aws_route53_record" "standalone_records" {
  count = length(var.standalone_records)

  zone_id = data.aws_route53_zone.selected[count.index].id
  name    = var.standalone_records[count.index].name
  type    = var.standalone_records[count.index].type
  ttl     = var.standalone_records[count.index].ttl
  records = [var.standalone_records[count.index].value == "" ? var.cf_domain[count.index] : var.standalone_records[count.index].value]
}