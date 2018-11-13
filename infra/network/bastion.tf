
resource "aws_key_pair" "bastion-key" {
  count = "${var.bastion-ssh-key != "" ? 1 : 0}"

  key_name = "bastion-key-${var.project-name}"
  public_key = "${var.bastion-ssh-key}"
}

data "aws_ami" "amazon-linux-ami" {

  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }

  filter {
    name = "root-device-type"
    values = ["ebs"]
  }

}

resource "aws_security_group" "bastion-sg" {
  name = "bastion-sg-${var.project-name}"
  vpc_id = "${aws_vpc.vpc-main.id}"
  revoke_rules_on_delete = true

  tags {
    Name = "bastion-sg-${var.project-name}"
    Category = "network"
    Project = "${var.project-name}"
    Description = "SG for the bastion host in the project ${var.project-name}"
  }
}

resource "aws_security_group_rule" "bastion-sg-ingress" {
  security_group_id = "${aws_security_group.bastion-sg.id}"
  description = "Allow all SSH traffic (IPv4)"

  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-sg-egress" {
  security_group_id = "${aws_security_group.bastion-sg.id}"
  description = "Allow all SSH traffic (IPv4)"

  type = "egress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow-ssh-from-bastion" {
  security_group_id = "${aws_security_group.default-sg.id}"
  description = "Allow SSH from the Bastion host"

  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  source_security_group_id = "${aws_security_group.bastion-sg.id}"
}

resource "aws_instance" "bastion-hosts" {
  count = "${var.bastion-hosts}"
  ami = "${data.aws_ami.amazon-linux-ami.id}"
  instance_type = "t2.nano"
  availability_zone = "${lookup(var.vpc-public-subnets[count.index], "az")}"
  subnet_id = "${element(aws_subnet.public-subnets.*.id, count.index)}"
  key_name = "${aws_key_pair.bastion-key.key_name}"

  vpc_security_group_ids = ["${aws_security_group.default-sg.id}", "${aws_security_group.bastion-sg.id}"]

  tags {
    Name = "bastion-${var.project-name}-${count.index}"
    Category = "network"
    Project = "${var.project-name}"
    Description = "Bastion host ${count.index} of the project ${var.project-name}"
    Role = "bastion"
    Index = "${count.index}"
  }
}
