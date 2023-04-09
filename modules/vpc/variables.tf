variable "vpc1_cidr_block" {
  type = string
  description = "cidr block range for vpc 1"
  default = "10.0.0.0/16"
}
variable "vpc2_cidr_block" {
  type = string
  description = "cidr block range for vpc 2"
  default = "173.0.0.0/16"
}