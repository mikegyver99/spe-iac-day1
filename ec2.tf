data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    #values = ["ubuntu/images/hvm-ssd/ubuntu-disco-19.04-amd64-server-*"]
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  resource "aws_instance" "tfc-mgarcia16-ec2" {
  instance_type     = "t3.nano"
  ami = data.aws_ami.ubuntu.id
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
