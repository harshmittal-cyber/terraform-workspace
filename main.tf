resource "aws_s3_bucket" "s3bucket" {
  bucket= var.bucket
  tags= var.tags
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each=[443,80,22]
    iterator = port
    content {
      description      = "TLS from VPC"
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }


  # ingress {
  #   description      = "TLS from VPC"
  #   from_port        = 443
  #   to_port          = 443
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
  #   ipv6_cidr_blocks = ["::/0"]
  # }

  # ingress {
  #   description      = "TLS from VPC"
  #   from_port        = 80
  #   to_port          = 80
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
  #   ipv6_cidr_blocks = ["::/0"]
  # }

  #   ingress {
  #   description      = "TLS from VPC"
  #   from_port        = 22
  #   to_port          = 22
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
  #   ipv6_cidr_blocks = ["::/0"]
  # }
  tags = {
    Name = "Harsh Mittal1"
    Owner = "harsh.mittal@cloudeq.com"
    purpose="terraform learning"
  }
}

resource "local_file" "file1"{
    content="Harsh Mittal"
    filename="harsh.html"
}

# used static content and localvariable filename
resource "local_file" "file2"{
    content="We need resources"
    filename=local.a
}

# used random id with decimal and localvariable filename
resource "local_file" "file3"{
    content="${random_id.server.dec}"
    filename=local.b
}


# locals
locals{
    a="harsh.py"
    b="harsh1.js"
}

# random resource
resource "random_id" "server"{
  byte_length = 8
}

