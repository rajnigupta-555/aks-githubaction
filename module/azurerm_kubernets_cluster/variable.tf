variable "akc_name"{}
variable "rg_name"{}
variable "location"{}
variable "tags" {}
variable "node_count" {
    default=2
}
variable "vm_size" {
    default="Standard_D2_v2"
}
variable "dns_prefix"{}