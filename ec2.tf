data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    #values = ["ubuntu/images/hvm-ssd/ubuntu-disco-19.04-amd64-server-*"]
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "tfc-mgarcia16-ec2" {
  instance_type     = "t3.nano"
  ami               = data.aws_ami.ubuntu.id
  availability_zone = "us-west-2c"
  tags = {
    Name        = "tfc-mgarcia16-ec2"
    Environment = "Sandbox"
  }
}
