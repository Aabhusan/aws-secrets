resource "aws_iam_user" "ml-team" {
  name = "mlteam-test"
  

  tags = {
    name = "ml-team"
  }
}

resource "aws_iam_access_key" "ml-team" {
  user = "${aws_iam_user.ml-team.name}"
}

resource "aws_iam_policy" "test_policy" {
  name = "test_policy"
  policy = "${file("./modules/policies/role-policy.json")}"
}

resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = "${file("./modules/policies/role-assume-policy.json")}"
}


resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = "${aws_iam_role.test_role.name}"
  policy_arn = "${aws_iam_policy.test_policy.arn}"
}


resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = "${aws_iam_user.ml-team.name}"
  policy_arn = "${aws_iam_policy.test_policy.arn}"
}


resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = "${aws_iam_role.test_role.name}"
}

#use this aws_iam_instance_profile in the ec2 using arguments iam_instance_profile:







