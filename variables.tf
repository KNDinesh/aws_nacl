# variables for the module
variable "vpc_id" {
  description = "ID of the VPC where the network ACL will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs associated with the network ACL"
  type        = list(string)
}

variable "ingress_rules" {
  description = "List of ingress rules for the network ACL"
  type        = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
}

variable "egress_rules" {
  description = "List of egress rules for the network ACL"
  type        = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
}

variable "tags" {
  description = "Tags to assign to the network ACL"
  type        = map(string)
  default     = {}
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "subnets" {
  description = "Map of subnet configurations"
  type = map(object({
    cidr_block  = string
    az          = string
    public      = bool
    environment = string
  }))
}
