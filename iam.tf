resource "aws_iam_role" "ec2_cw_role"{
    name = "EC2-cloudwatch"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = ["ec2.amazonaws.com"]
                }
            }   
        ]
    })
}

resource "aws_iam_role_policy_attachment" "cw_agent_policy_attach" {
    role = aws_iam_role.ec2_cw_role.name
    policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_instance_profile" "ec2_profile" {
    name = "EC2-cloudwatch"
    role = aws_iam_role.ec2_cw_role.name
}