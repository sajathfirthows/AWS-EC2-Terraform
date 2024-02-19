resource "aws_spot_instance_request" "my-spot-inst" {
  ami             = "ami-0c7217cdde317cfec" 
  spot_price             = "0.016"
  instance_type          = "t3.small"
  spot_type              = "one-time"
  wait_for_fulfillment   = "true"  
  subnet_id       = aws_subnet.my-subnet.id
  associate_public_ip_address = true
  user_data       = <<-EOF
                      #!/bin/bash
                      sudo yum update -y
                      sudo yum install -y httpd
                      sudo systemctl enable httpd
                      sudo systemctl start httpd
                    EOF
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = aws_vpc.vpc.id
}

resource "aws_security_group" "my_sg" {
  name        = "my-security-group"
  description = "My custom security group"
  vpc_id      = aws_vpc.vpc.id 
}
