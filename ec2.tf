resource "aws_instance" "tfc-mgarcia16-ec2" {
  instance_type     = "t3.nano"
  availability_zone = "us-west-2c"
  tags = {
    Name        = "tfc-mgarcia16-ec2"
    Environment = "Sandbox"
  }

  root_block_device {
    volume_size           = "40"
    volume_type           = "gp2"
    delete_on_termination = "true"
  }
}
