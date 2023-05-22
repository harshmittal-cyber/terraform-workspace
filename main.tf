resource "aws_s3_bucket" "s3bucket" {
  bucket= var.bucket
  tags= var.tags
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

