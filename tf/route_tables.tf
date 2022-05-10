resource "aws_route_table" "dns-rt-public" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name = "DNS-rt-public"
  }
}

resource "aws_route_table_association" "public2route1" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.dns-rt-public.id
}

resource "aws_route_table_association" "public2route2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.dns-rt-public.id
}

resource "aws_route_table" "dns-rt-private" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "DNS-rt-private"
  }
}

resource "aws_route_table_association" "private2route1" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.dns-rt-private.id
}

resource "aws_route_table_association" "private2route2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.dns-rt-private.id
}
