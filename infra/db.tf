resource "aws_db_instance" "default" {
  allocated_storage      = 5
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "10.7"
  instance_class         = "db.t2.micro"
  name                   = "db_name"
  username               = "db_user"
  password               = "db_password"
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  port                   = 5432
  db_subnet_group_name   = aws_db_subnet_group.data.name
  skip_final_snapshot    = true

}

resource "aws_db_subnet_group" "data" {
  subnet_ids = [aws_subnet.data_az1.id, aws_subnet.data_az2.id, aws_subnet.data_az3.id]




}
