

resource "aws_iam_role" "lambda_role" {
  name = "${var.project}-lambda-role-${var.env}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
  tags = {
    Name = "${var.project}-lambda-role-${var.env}"
  }

}

resource "aws_iam_policy" "lambda_policy" {
  name = "${var.project}-lamda-policy-${var.env}"
  path = "/"
  description = "IAM policy for logging from a Lambda function"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:DescribeLogStreams",
                "logs:PutLogEvents",
                "logs:GetLogEvents",
                "logs:CreateLogGroup"
            ],
            "Resource": "arn:aws:logs:${var.region}:${var.aws_account_id}:log-group:/aws/lambda/${var.project}*:*"
        },
        {
          "Effect": "Allow",
          "Action": [
            "s3:*",
            "s3-object-lambda:*"
          ],
          "Resource": [
            "arn:aws:s3:::${var.lambda_bucketname}",
            "arn:aws:s3:::${var.lambda_bucketname}/*",
            "arn:aws:s3:::${var.output_bucketname}",
            "arn:aws:s3:::${var.output_bucketname}/*"
          ]
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
  role = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_s3_bucket_policy" "lambda_bucket_policy" {
  bucket = var.lambda_bucketname

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DelegateS3Access",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_iam_role.lambda_role.arn}"
            },
            "Action": [
                "s3:ListBucket",
                "s3:*Object"
            ],
            "Resource": [
                "arn:aws:s3:::${var.lambda_bucketname}/*",
                "arn:aws:s3:::${var.lambda_bucketname}"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket_policy" "output_bucket_policy" {
  bucket = var.output_bucketname

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DelegateS3Access",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_iam_role.lambda_role.arn}"
            },
            "Action": [
                "s3:ListBucket",
                "s3:*Object"
            ],
            "Resource": [
                "arn:aws:s3:::${var.output_bucketname}/*",
                "arn:aws:s3:::${var.output_bucketname}"
            ]
        }
    ]
}
POLICY
}
