output "network_acl_id" {
  description = "The ID of the created network ACL"
  value       = aws_network_acl.custom_network_acl.id
}
