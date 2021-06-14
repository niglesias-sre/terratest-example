resource "aws_network_interface" "if_subnet_1" {
  subnet_id   = aws_subnet.subnet_1.id
  private_ips = ["10.200.1.100"]
}

resource "aws_network_interface" "if_subnet_2" {
  subnet_id   = aws_subnet.subnet_2.id
  private_ips = ["10.200.2.100"]
}