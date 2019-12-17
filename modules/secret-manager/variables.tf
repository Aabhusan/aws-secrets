variable "kms_key_id" {
  type        = string
  description = "KMS key id used for encrypting key at rest by aws secrets manager"
}

variable "name" {
  type        = string
  description = "Name of the secret to be stored"
  default     = "aws-secrets-rds"
}

variable "version_stages" {
  type        = list(string)
  default     = ["AWSCURRENT"]
  description = " Specifies a list of staging labels that are attached to this version of the secret. A staging label must be unique to a single version of the secret"
}

variable "secret-string" {
  default = {
    username             = ""
    password             = ""
    engine               = ""
    host                 = ""
    port                 = ""
    dbInstanceIdentifier = ""
  }

  type = "map"
}