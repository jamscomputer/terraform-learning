#Creating an IAM Policy
resource "aws_iam_policy" "ec2_connect_policy" {
  name        = "ec2_connect_policy"
  path        = "/"
  description = "Policy to Instance connect service"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "EC2InstanceConnect",
        "Action" : [
          "ec2:DescribeInstances",
          "ec2-instance-connect:SendSSHPublicKey"
        ],
        "Condition": {
            "StringEquals": {
                "ec2:osuser": "ec2-user"
            }
        }
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })
}

#Creating a Role to use the IAM policy
resource "aws_iam_role" "ec2_instance_connect_role" {
  name = "ec2_instance_connect_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    "Statement" : [
      {

        Action = "sts:AssumeRole"
        Effect : "Allow"
        Sid = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    "Name" = "Instance_connect_role"
    "Owner" = "Terraform"
    "Env" = "Dev"
  }
}

#Attaching the role to IAM Policy
resource "aws_iam_policy_attachment" "ec2_connect_policy_role" {
  name       = "ec2_instance_connect_attachment"
  roles      = [aws_iam_role.ec2_instance_connect_role.name]
  policy_arn = aws_iam_policy.ec2_connect_policy.arn

}

#Creating an instance profile to set the role to EC2 instance
resource "aws_iam_instance_profile" "ec2_connect_profile" {
  name = "ec2_connect_profile"
  role = aws_iam_role.ec2_instance_connect_role.name

}



