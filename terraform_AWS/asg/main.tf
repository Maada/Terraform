# data set for AZ
data "aws_availability_zone" "first" {
    name = "eu-west-2a"
}


# Security Group for EC2

resource "aws_security_group" "instance" {
    name = "terraform-example-instance"
    ingress {
        from_port = 8080
        to_port   = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        from_port = 22
        to_port   = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port   = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}



# Lauch Config
resource "aws_launch_configuration" "example" {
    image_id = "ami-00e8b55a2e841be44"
    instance_type = "t2.micro"
    security_groups = ["${aws_security_group.instance.id}"]
    user_data = <<-EOF
                 #!/bin/bash
                 sudo apt-get -y update
                 sudo apt-get -y install ngnix
                 sudo apt-get -y install ngnix
                 EOF
    lifecycle {
        create_before_destroy = true
    }
}


# ASG

resource "aws_autoscaling_group" "example" {
    launch_configuration = "${aws_launch_configuration.example.id}"
    availability_zones = ["${data.aws_availability_zone.first.name}"]
    health_check_grace_period = 300
    min_size = 2
    max_size = 5
    tag {
        key = "Name"
        value = "autoscale"
        propagate_at_launch = true
    }
  
}

resource "aws_autoscaling_schedule" "example" {
  scheduled_action_name = "christmas"
  min_size = 4
  max_size = 5
  desired_capacity = 4
  start_time = "2019-12-24T18:00:00Z"
  end_time = "2019-12-25T06:00:00Z"
  autoscaling_group_name = "${aws_autoscaling_group.example.name}"
}





# Schedule (Advanced)