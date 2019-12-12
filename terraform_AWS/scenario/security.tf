resource "aws_security_group" "group" {
    name = "OurGroup"

    tags {
        name = "OurGroup"
    }
  
}

resource "aws_security_group_rule" "single" {
    type = "ingress"
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.group.id}"
}

resource "aws_security_group_rule" "range1" {
    type = "ingress"
    from_port = "1000"
    to_port = "1005"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.group.id}"
}


resource "aws_security_group" "scenario" {
    name = "scenario"

    tags {
        name = "OurGroup"
    }
  
}

resource "aws_security_group_rule" "single1" {
    type = "ingress"
    from_port = "8080"
    to_port = "8080"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.scenario.id}"
}

resource "aws_security_group_rule" "single2" {
    type = "ingress"
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.scenario.id}"
}

resource "aws_security_group_rule" "range2" {
    type = "ingress"
    from_port = "998"
    to_port = "999"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.scenario.id}"
}