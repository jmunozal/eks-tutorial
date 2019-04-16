resource "aws_vpc" "main" {
  cidr_block       = "${var.cidr_vpc}"

  tags = {
    Name = "terraform-eks-demo"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id            = "${aws_vpc.main.id}"
  count             = "${length(var.cidr_subnets)}"
  cidr_block        = "${var.cidr_subnets[count.index]}"
  availability_zone = "${var.az_subnets[count.index]}"
}

resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.main.id}"
  tags = {
    Name = "terraform-eks-demo"
  }
}

resource "aws_route_table" "demo" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig.id}"
  }
}

resource "aws_route_table_association" "demo" {
  count          = "${length(var.cidr_subnets)}"
  subnet_id      = "${aws_subnet.subnet.*.id[count.index]}"
  route_table_id = "${aws_route_table.demo.id}"
}
