variable "barretsSubnetNames" {
    default = ["STE07", "STE06", "STE05"]
}

output "subnetName" {
  value = contains(var.barretsSubnetNames, aws_subnet.private-us-west-1a)
}