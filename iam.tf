
resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"
  assume_role_policy= "${file("policy/assume_policy.json")}"
}


resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = "${aws_iam_role.ec2_role.name}"
}


resource "aws_iam_role_policy" "role_policy" {
  name = "role_policy"
  role = "${aws_iam_role.ec2_role.id}"
  policy= "${file("policy/policy.json")}"
}

