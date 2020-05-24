resource "aws_instance" "zabbix_server" {
  provider               = aws.virginia
  count                  = 1
  ami                    = "ami-0b9a611a02047d3b1"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-f1c30eff"
  key_name               = "key-3-us-east-1"
  vpc_security_group_ids = ["${aws_security_group.allow_port_22.id}","${aws_security_group.allow_port_10050.id}","${aws_security_group.allow_port_80.id}"]

  root_block_device {
    volume_type           = "standard"
    volume_size           = 10
    delete_on_termination = true
  }

  provisioner "remote-exec" {
    inline = [
      "touch /tmp/test",
    ]
    connection {
      type        = "ssh"
      user        = "admin"
      host        = self.public_ip
      private_key = file("${path.module}/key-3-us-east-1.pem")
    }
  }

  tags = {
    Name = "Zabbix_server"
    SO   = "Debian",
    Version = "10"
  }
}

resource "aws_instance" "zabbix_client" {
  provider               = aws.virginia
  count                  = 1
  ami                    = "ami-0b9a611a02047d3b1"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-f1c30eff"
  key_name               = "key-3-us-east-1"
  vpc_security_group_ids = ["${aws_security_group.allow_port_22.id}"]

  root_block_device {
    volume_type           = "standard"
    volume_size           = 10
    delete_on_termination = true
  }

  provisioner "remote-exec" {
    inline = [
      "touch /tmp/test",
    ]
    connection {
      type        = "ssh"
      user        = "admin"
      host        = self.public_ip
      private_key = file("${path.module}/key-3-us-east-1.pem")
    }
  }

  tags = {
    Name = "Zabbix_client",
    SO   = "Debian",
    Version = "10"
  }
}
