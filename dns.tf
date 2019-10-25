resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
resource "aws_route53_zone" "private" {
  name = "${var.bucket_name}"

  vpc {
    vpc_id = "${aws_default_vpc.default.id}"
  }
}
