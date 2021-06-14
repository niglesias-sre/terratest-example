resource "aws_vpc" "my_vpc" {
  cidr_block = "10.200.0.0/16"

  tags = {
    "Name"  = "My VPC"
    "Owner" = "InfraTeam"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.200.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "Subnet 1"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.200.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    "Name" = "Subnet 2"
  }
}