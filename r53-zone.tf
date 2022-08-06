data "aws_vpc" "vpc" {
  count = length(var.zones)
  filter {
    name   = "tag:Name"
    values = [var.zones[count.index].vpc_name]
  }
}

resource "aws_route53_zone" "zone" {
  count = length(var.zones)

  name    = var.zones[count.index].name
  comment = var.zones[count.index].desc

  vpc {
    vpc_id = data.aws_vpc.vpc[count.index].id
  }
}