resource "aws_instance" "ec2" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    count = "${var.count}"
    associate_public_ip_address = "${var.ip_address}"
    vpc_security_group_ids = ["${aws_security_group.group.name}", "${aws_security_group.scenario.name}"]

    root_block_device {
        volume_size = "${var.volume_size}"
    }


    tags {
        Name = "${var.name}-${count.index+1}-${var.environnement}-${var.project}"
        Region = "${var.region}"
        Count = "${var.count}"
        Timestamp = "${replace("${timestamp()}",":","-")}"
        Project = "${var.project}"
        Environnement = "${var.environnement}"
    }

}


output "region" { value = "${var.region}"}

output "ami" {value = "${aws_instance.ec2.*.ami}"}

output "instance_type" {value = "${aws_instance.ec2.*.instance_type}"}

output "external_ip" {value = "${aws_instance.ec2.*.associate_public_ip_address}"}