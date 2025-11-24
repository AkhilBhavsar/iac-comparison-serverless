provider "aws" {
  region = var.region
}

resource "aws_vpc" "this" {
  cidr_block = var.cidr
  tags = {
    Name     = "demo-vpc"
    Team     = var.team_tag
}
}




resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr, 4, count.index)
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]
}

data "aws_availability_zones" "available" {}

