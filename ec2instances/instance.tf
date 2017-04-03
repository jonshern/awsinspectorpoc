resource "aws_instance" "linuxec2" {
  ami                         = "ami-0b33d91d"
  instance_type               = "t2.small"
  associate_public_ip_address = "true"
  subnet_id                   = "subnet-1a152c53"

  key_name = "${aws_key_pair.mykey.key_name}"

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "file" {
    source      = "awscli.conf"
    destination = "/tmp/awscli.conf"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
      "sudo cp /tmp/awscli.conf /etc/awslogs/awscli.conf",
    ]
  }

  connection {
    user        = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }

  # Create the standard set of tags
  tags {
    App          = "TerraformAWSInpectorOne"
    Name         = "TerraformAWSInpectorOne"
    CreationTime = "${timestamp()}"
    Group        = "InspectorTest"
  }
}

# Create a key pair in aws
resource "aws_key_pair" "mykey" {
  key_name   = "InspectorTestKey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
