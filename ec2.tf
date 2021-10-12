resource "aws_instance" "tfc-mgarcia16-ec2" {
  instance_type     = "t3.nano"
  ami               = "ami-0c2d06d50ce30b442" #AWS Linux
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
