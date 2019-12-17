module "kms_key" {
  source = "./modules/kms_key"
  namespace               = "myspace"
  stage                   = "dev"
  name                    = "rds-mysql-key"
  deletion_window_in_days = "10"
}

  
}

module "secret-manager" {
  source = "./modules/secret-manager"
  namespace            = "myspace"
  stage                = "dev"
  name                 = "Mysql_Password"
  secret-string         = {
    username             = "demo"
    password             = "fakepassword"
    engine               = "mysql"
    host                 = "wordpress-db.ci6ifuaz6osi.eu-central-1.rds.amazonaws.com"
    port                 = "3306"
    dbInstanceIdentifier = "wordpress-db"
  }
  kms_key_id             = module.kms_key.key_id
}