  resource "aws_instance" "instance_1"{
      ami             = var.ami #ubuntu us-east-1
      instance_type   = var.instance_type #t2 micro
      security_groups = [aws_security_group.instances.name]
      user_data       = <<-EOF
                    #!/bin/bash                       
                    echo "Hello world 1" > index.html
                    python3 -m http.server 8080 &
                    EOF
  }

  resource "aws_instance" "instance_2"{
      ami             = var.ami #ubuntu us-east-1
      instance_type   = var.instance_type #t2 micro
      security_groups = [aws_security_group.instances.name]
      user_data       = <<-EOF
                    #!/bin/bash                       
                    echo "Hello world 2" > index.html
                    python3 -m http.server 8080 &
                    EOF
  }