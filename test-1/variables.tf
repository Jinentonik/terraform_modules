variable "region" {
  type    = string
  default = "us-east-1" # Replace with the default region you want to use
}
variable "windows_ami" {
  type = string
  default = "ami-024614f01f42eeb66"
}