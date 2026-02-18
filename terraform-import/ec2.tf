resource "aws_instance" "kops-mgmt" {
    ami = "ami-00ca570c1b6d79f36"
    instance_type = "t3.small"
    vpc_security_group_ids = ["sg-041893da1be804cd1"]
    subnet_id = "subnet-080dc8f3ee3b32709"
    associate_public_ip_address = true

    tags = {
      Name = "kops-mgmt"
    }
  
}