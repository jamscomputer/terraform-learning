/* #manejo de IAM Groups y roles
resource "aws_iam_group" "admins" {
  name = "administradores"
}

resource "aws_iam_policy_attachment" "admins-attach" {
  name       = "admins-attach"
  groups     = ["${aws_iam_group.admins.name}"]
  policy_arn = "arn:aws:iam::aws:policy/job-function/SystemAdministrator"
}

resource "aws_iam_user" "tf-admin1" {
  name = "tf-admin1"

}

resource "aws_iam_user" "tf-admin2" {
  name = "tf-admin2"

}

resource "aws_iam_group_membership" "admin-users" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.tf-admin1.name,
    aws_iam_user.tf-admin2.name,
  ]

  group = aws_iam_group.admins.name
}

resource "aws_iam_access_key" "admin1-access" {
  user = aws_iam_user.tf-admin1.name

}
resource "aws_iam_access_key" "admin2-access" {
  user = aws_iam_user.tf-admin2.name

}
 */
 
  
