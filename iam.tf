resource "aws_iam_user" "myiamuser" {
  name = "terraformuser"
}

resource "aws_iam_group" "mygfg" {
  name = "mygfg"
}

resource "aws_iam_group_membership" "mygfgassociation" {
  name = "tf-gfg-group-membership"

  users = [
    aws_iam_user.myiamuser.name,
    "pranjal"
  ]

  group = aws_iam_group.mygfg.name
}