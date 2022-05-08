resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "DNS-public1"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "DNS-private2"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1b"

  tags = {
    Name = "DNS-public2"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "DNS-private2"
  }
}