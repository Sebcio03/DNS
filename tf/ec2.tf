resource "aws_instance" "foo" {
  ami           = "ami-09439f09c55136ecf"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id
  key_name = aws_key_pair.deployer

  network_interface {
    network_interface_id = aws_network_interface.default.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}

variable "aws_ec2_dev_key" {
  description = "AWS EC2 Key"
  type = string
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.aws_ec2_dev_key
}
