resource "aws_iam_user" "user" {
    name = "myuser"

}

resource "aws_iam_access_key" "userkey" {
    user = "${aws_iam_user.user.name}"
  
}

resource "aws_iam_user_policy" "userpolicy" {
    name = "mypolicy"
    user = "${aws_iam_user.user.name}"

    policy = <<EOF

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ec2:Describe*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "elasticloadbalancing:Describe*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "cloudwatch:ListMetrics",
                "cloudwatch:GetMetricStatistics",
                "cloudwatch:Describe*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "autoscaling:Describe*",
            "Resource": "*"
        }
    ]
}
EOF
  
}

resource "aws_iam_group" "mygroup" {
    name = "testgroup"
  
}


  

