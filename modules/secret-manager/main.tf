# resource "aws_secretsmanager_secret" "this" {
#   name        = var.name
#   description = "This secret is created by terrraform for aws-rds"
#   #tags        = module.label.tags
#   kms_key_id  = var.kms_key_id
# }

# resource "aws_secretsmanager_secret_version" "this" {
#   secret_id      = aws_secretsmanager_secret.this.id
#   secret_string  = jsonencode(var.secret-string)
#   version_stages = var.version_stages
# }


