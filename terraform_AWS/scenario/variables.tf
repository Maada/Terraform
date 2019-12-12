variable "ami" { default = "ami-087855b6c8b59a9e4"}
  
variable "instance_type" { default = "t2.micro"}

variable "count" { default = "3"}

variable "ip_address" { default = "true"}

variable "volume_size" { default = "35"}

variable "name" { default = "udemy"}

variable "project" { default = "terraform"}

variable "environnement" { default = "dev"}

variable "region" { default = "eu-west-2"}