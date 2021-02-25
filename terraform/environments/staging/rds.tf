locals {
  db_identifier = "${var.project_name}-${local.environment}"
}

resource "aws_db_instance" "this" {
  identifier                   = local.db_identifier
  name                         = replace(local.db_identifier, "-", "_")
  engine                       = "postgres"
  engine_version               = "11.4"
  instance_class               = "db.t2.micro"
  allocated_storage            = 20
  storage_type                 = "gp2"
  username                     = replace(var.db_username, "-", "")
  password                     = var.db_password
  backup_retention_period      = 7
  performance_insights_enabled = true
  deletion_protection          = true
  multi_az                     = false
  vpc_security_group_ids       = [aws_security_group.db_server.id]
  skip_final_snapshot          = true
}
