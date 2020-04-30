resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public" {

  count =   "${var.count_public_subnet}"
  vpc_id     = "${var.vpc_id}"
  cidr_block = "$var.public_subnets[count.index]"
  availability_zone = "$var.availability_zones[count.index]"


  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "private" {
  count =  " ${var.count_private_subnet}"
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "var.private_subnets[count.index]"
  availability_zone = "$var.availability_zones[count.index]"


  tags = {
    Name = "Private Subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "main"
  }
}



resource "aws_route_table" "public_table" {
  vpc_id = "${var.vpc_id}"

  route {
    count =       " ${var.count_public_subnet}"
    cidr_block = "$var.public_subnets[count.index]"
    gateway_id = "${aws_internet_gateway.main.id}"
  }


  tags = {
    Name = "public_table"
  }
}




resource "aws_route_table" "private_table" {
  vpc_id = "${var.vpc_id}"

  route {

    count =" ${var.count_private_subnet}"
    cidr_block = "$var.private_subnets[count.index]"

  }


  tags = {
    Name = "private_table"
  }
}


resource "aws_route_table_association" "public" {
  subnet_id      = "${var.public_subnet_id }"
  route_table_id = "${var.public_table_id}"
}

resource "aws_route_table_association" "private" {
  subnet_id      = "${var.private_subnet_id}"
  route_table_id = " ${var.private_table_id}"
}


