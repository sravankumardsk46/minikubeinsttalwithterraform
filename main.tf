resource "aws_instance" "minikube" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = local.key_name

  security_groups = [aws_security_group.minikube_sg.name]

  user_data = file("install-minikube.sh") # Bootstrap script

  tags = {
    Name = "Minikube-Server"
  }
}

resource "aws_security_group" "minikube_sg" {
  name        = "minikube-sg"
  description = "Allow SSH and Kubernetes Ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
