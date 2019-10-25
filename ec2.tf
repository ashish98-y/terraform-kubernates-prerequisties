resource "aws_instance" "cluster-ec2" {
  	ami = "${var.ami_id}"
  	instance_type = "t2.micro"
  	user_data="${data.template_file.init.rendered}"
  	iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  	key_name = "test"
	tags={
		Name="cluster-ec2"
	}
}

data "template_file" "init"{
 template="${file("user_data.sh.tpl")}"
	vars={
		clusterName="${var.KOPS_CLUSTER_NAME}"
		bucketName="${var.bucket_name}"
	}
}
