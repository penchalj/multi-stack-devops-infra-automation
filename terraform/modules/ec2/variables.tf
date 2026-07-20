variable "vpc_id"            { type = string }
variable "public_subnet_id"  { type = string }
variable "private_subnet_id" { type = string }
variable "frontend_sg_id"    { type = string }
variable "backend_sg_id"     { type = string }
variable "db_sg_id"          { type = string }
variable "key_name"          { type = string }
variable "ami_id"            { type = string }
variable "instance_type" {
  type    = string
  default = "t3.micro"
}