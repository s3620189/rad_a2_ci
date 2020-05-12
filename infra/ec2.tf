resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.public_key

}





data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_launch_configuration" "ec2_assignment2_app" {
  name            = "web_config"
  image_id        = data.aws_ami.amazon-linux-2.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.allow_http_ssh.id]

  key_name = aws_key_pair.deployer.key_name
}

resource "aws_lb_target_group" "a2_app" {
  name     = "a2-app-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

}
resource "aws_autoscaling_group" "a2_app" {
  name                 = "terraform-a2"
  launch_configuration = aws_launch_configuration.ec2_assignment2_app.name
  min_size             = 1
  max_size             = 1
  vpc_zone_identifier  = [aws_subnet.private_az1.id, aws_subnet.private_az2.id, aws_subnet.private_az3.id]
  target_group_arns    = [aws_lb_target_group.a2_app.arn]


}

resource "aws_lb" "a2_app" {
  name               = "a2-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http_ssh.id]
  subnets            = [aws_subnet.public_az1.id, aws_subnet.public_az2.id, aws_subnet.public_az3.id]

  tags = {
    Environment = "production"
  }


}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.a2_app.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.a2_app.arn

  }

}


