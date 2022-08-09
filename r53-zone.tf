data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.zones.vpc_name]
  }
}

resource "aws_route53_zone" "zone" {
  name    = var.zones.name
  comment = var.zones.desc

  vpc {
    vpc_id = data.aws_vpc.vpc.id
  }
}