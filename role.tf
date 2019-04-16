resource "aws_iam_role" "eksServiceRole" {
  name = "eksServiceRole"
  description = "Allows EKS to manage clusters on your behalf"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      tag-key = "tag-value"
  }
}

resource "aws_iam_role_policy_attachment" "cluster-attach" {
  role       = "${aws_iam_role.eksServiceRole.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "service-attach" {
  role       = "${aws_iam_role.eksServiceRole.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}
