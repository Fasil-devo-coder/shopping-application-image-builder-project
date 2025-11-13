#downloading packer plugin like terraform aws module or provider
packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}



source "amazon-ebs" "image" {
  ami_name = local.image_name
  source_ami = var.ami_id
  instance_type = var.instance_type
  ssh_username = "ec2-user"
  region     = var.region
 
  tags = {
    Name = local.image_name
    Project = var.project_name
    Environment = var.project_environment
  }
}

build {
  sources = [ "source.amazon-ebs.image" ]

  provisioner "file"{
    source  ="../website"
    destination = "/tmp"


  provisioner "shell"{
    script = "./provision.sh"
    execute_command = "sudo {{.Path}}"
  }
}
