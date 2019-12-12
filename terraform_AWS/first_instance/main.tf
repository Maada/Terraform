resource "aws_instance" "test_instance" {
    ami = "${var.value_ami}"
    instance_type = "${var.instance}"

    tags = {
        Name = "my_first_instance"

    }
  
}

output "instance_ami" { value = "${aws_instance.test_instance.ami}"}

output "instance_type" { value = "${aws_instance.test_instance.instance_type}"}


