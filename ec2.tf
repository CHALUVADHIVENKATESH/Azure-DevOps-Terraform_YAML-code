data "aws_ami" "my_ami" {
     most_recent      = true
     #name_regex       = "^mavrick"
     owners           = ["721834156908"]
}


resource "aws_instance" "web-1" {
    count = 3
    #ami = var.imagename
    #ami = "ami-0d857ff0f5fc4e03b"
    ami = "${data.aws_ami.my_ami.id}"
    availability_zone = "us-east-2a"
    instance_type = "t2.micro"
    key_name = "Ohio-Keypair3"
    subnet_id = "${aws_subnet.subnet1-public.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true	
    tags = {
        Name = "Server-0${count.index+1}"
        Env = "Prod"
        Owner = "Sree"
	    CostCenter = "ABCD"
    }
}
