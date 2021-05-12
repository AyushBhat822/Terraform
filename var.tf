variable "x" {
  type = string 
  default = "linux world"
}

output "myvalue" {

  value = "YAAA  ${var.x} hii Bye guys"

}
