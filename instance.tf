# Search latest Ubuntu Focal AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Launch first instance
resource "aws_instance" "traefik_1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.if_subnet_1.id
    device_index         = 0
  }

  tags = {
    "Name"  = "Traefik 1"
    "Owner" = "InfraTeam"
  }
}

# Launch second instance
resource "aws_instance" "traefik_2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.if_subnet_2.id
    device_index         = 0
  }

  tags = {
    "Name"  = "Traefik 2"
    "Owner" = "InfraTeam"
  }
}