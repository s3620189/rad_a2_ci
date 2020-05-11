data "aws_ami" "latest-ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_launch_configuration" "ec2_assignment2_app" {
  name          = "web_config"
  image_id      = data.aws_ami.latest-ubuntu.id
  instance_type = "t2.micro"
}

