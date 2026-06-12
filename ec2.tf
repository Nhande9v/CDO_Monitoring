resource "aws_instance" "web_server" {
    ami = var.ami_id
    instance_type = var.instance_type
    iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
    user_data = file("${path.module}/userdata.sh")

    tags = {
        Name = "Lab-CloudWatch-EC2"
    }
}