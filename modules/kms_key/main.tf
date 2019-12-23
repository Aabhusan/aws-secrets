resource "aws_kms_key" "default" {
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  #tags                    = module.label.tags
  description             = var.description
}

resource "aws_kms_alias" "default" {
  name          = "alias/aws-kms-alias"             
  #name          = coalesce(var.alias, format("alias/%v", module.label.id))
  target_key_id = aws_kms_key.default.id
}


