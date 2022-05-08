resource "aws_nat_gateway" "dns-nat1" {
  allocation_id = aws_eip.dns-1.id
  subnet_id     = aws_subnet.private.id

  tags = {
    Name = "DNS-private-nat1"
  }
}

resource "aws_nat_gateway" "dns-nat2" {
  allocation_id = aws_eip.dns-2.id
  subnet_id     = aws_subnet.private2.id

  tags = {
    Name = "DNS-private2-nat"
  }
}