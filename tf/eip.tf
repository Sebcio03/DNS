resource "aws_eip" "dns-1" {
  vpc = true
}
resource "aws_eip" "dns-2" {
  vpc = true
}
