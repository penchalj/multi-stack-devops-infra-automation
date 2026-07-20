variable "aws_region"     { default = "us-east-1" }
variable "key_name"       { default = "voting-app-key" }
variable "ami_id"         { default = "ami-0c7217cdde317cfec" } # Amazon Linux 2023
variable "instance_type"  { default = "t3.micro" }