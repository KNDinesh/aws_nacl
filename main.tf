# module.vpc_module.aws_network_acl.Advalent_Prod_IPMG_Nacl:
resource "aws_network_acl" "Advalent_Prod_IPMG_Nacl" {
  vpc_id = var.vpc_id
  subnet_ids = [
        "subnet-03fa54a5ea6ce89e1",
        "subnet-079b2ab1fda62b1bd",
        "subnet-0a1c0b1b421bb75ba",
        "subnet-0b23f76bfce3591ad",
        "subnet-0dbcbcede8913bc79",
        "subnet-0dc0c96b89de1c40f",
  ]

  # allow ingress port 3389 on Advalent VPN
  ingress {
    protocol   = "6"
    rule_no    = 100
    action     = "allow"
    cidr_block = "52.26.224.194/32" 
    from_port  = 3389  # RDP port
    to_port    = 3389  # RDP port
  }

  # Deny ingress port 3389 on other all ips 

  ingress {
    protocol   = "6"
    rule_no    = 110
    action     = "deny"
    cidr_block = "0.0.0.0/0" 
    from_port  = 3389  # RDP port
    to_port    = 3389  # RDP port
  }
  
  # Deny ingress port 445 on other all ips
  ingress {
    protocol   = "6"
    rule_no    = 120
    action     = "deny"
    cidr_block = "0.0.0.0/0" 
    from_port      = 445  # SMB port
    to_port        = 445  # SMB port
  }
  
  # Deny ingress port 6667 on other all ips
  ingress {
    protocol   = "6"
    rule_no    = 130
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 6667
    to_port    = 6667
  }
  
  
  ingress {
      protocol   = "-1"
      rule_no    = 140
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
  }

# allow egress port 3389 
  egress {
    protocol   = "6"
    rule_no    = 100
    action     = "allow"
    cidr_block = "52.26.224.194/32"
    from_port  = 3389 
    to_port    = 3389
  }
  
  # deny egress port 3389 
  egress {
    protocol   = "6"
    rule_no    = 110
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 3389  
    to_port    = 3389 
  }
 
  # deny egress port 445
  egress {
    protocol   = "6"
    rule_no    = 120
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 445
    to_port    = 445
  }

  # deny egress port 6667
  egress {
    protocol   = "6"
    rule_no    = 130
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 6667
    to_port    = 6667
  }

  egress {
    protocol   = "-1"
    rule_no    = 140
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }


tags = {
    Name = "Advalent Prod IPMG Nacl"
}
}
