resource "aws_db_instance" "rds" {
  allocated_storage      = 20
  identifier = "prajwal-rds"
  db_subnet_group_name   = aws_db_subnet_group.sub-grp.id
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  multi_az               = true
  db_name                = "mydb"
  username               = var.rds-username
  password               = var.rds-password
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.book-rds-sg.id ]
  depends_on = [ aws_db_subnet_group.sub-grp ]
  publicly_accessible = false
  backup_retention_period = 7

  
  tags = {
    DB_identifier = "prajwal-rds"
  }
}

resource "aws_db_subnet_group" "sub-grp" {
  name       = "dbbmain"
  subnet_ids =  [aws_subnet.private-subnet-rds-7a.id , aws_subnet.private-subnet-rds-8b.id ]
  depends_on = [ aws_subnet.private-subnet-rds-7a , aws_subnet.private-subnet-rds-8b ]

  tags = {
    Name = "My DB subnet group"
  }

}