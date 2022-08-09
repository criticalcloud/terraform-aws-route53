resource "aws_route53_record" "standalone_records" {
  count = length(var.standalone_records)

  zone_id = aws_route53_zone.zone.id
  name    = var.standalone_records[count.index].name
  type    = var.standalone_records[count.index].type
  ttl     = var.standalone_records[count.index].ttl
  records = [var.standalone_records[count.index].value]
}