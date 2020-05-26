resource "aws_security_group" "allow_port_22" {
  provider    = aws.virginia
  name        = "allow_port_22"
  description = "Libera entrada na porta 22"
  vpc_id      = "vpc-ef91b595"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_access_port_22"
  }
}

resource "aws_security_group" "allow_port_80" {
  provider    = aws.virginia
  name        = "allow_port_80"
  description = "Libera entrada na porta 80"
  vpc_id      = "vpc-ef91b595"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_access_port_80"
  }
}

resource "aws_security_group" "allow_port_10050" {
  provider    = aws.virginia
  name        = "allow_port_10050"
  description = "Libera entrada na porta 10050"
  vpc_id      = "vpc-ef91b595"

  ingress {
    from_port   = 10050
    to_port     = 10050
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_access_port_10050"
  }
}

resource "aws_security_group" "allow_port_10051" {
  provider    = aws.virginia
  name        = "allow_port_10051"
  description = "Libera entrada na porta 10051"
  vpc_id      = "vpc-ef91b595"

  ingress {
    from_port   = 10051
    to_port     = 10051
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_access_port_10051"
  }
}
