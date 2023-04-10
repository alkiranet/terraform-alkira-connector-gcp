/*
Alkira data sources
https://registry.terraform.io/providers/alkiranet/alkira/latest/docs
*/
data "alkira_billing_tag" "tag" {
  for_each = toset(var.billing_tags)
  name     = each.key
}

data "alkira_credential" "credential" {
  name = var.credential
}

data "alkira_group" "group" {
  name = var.group
}

data "alkira_policy_prefix_list" "list" {
  for_each = toset(var.gcp_routing.prefix_lists)
  name     = each.key
}

data "alkira_segment" "segment" {
  name = var.segment
}

locals {

  tag_id_list = [
    for v in data.alkira_billing_tag.tag : v.id
  ]

  pfx_id_list = [
    for v in data.alkira_policy_prefix_list.list : v.id
  ]

}

/*
alkira_connector_gcp_vpc
https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/resources/connector_gcp_vpc
*/
resource "alkira_connector_gcp_vpc" "connector" {
  billing_tag_ids  = local.tag_id_list
  credential_id    = data.alkira_credential.credential.id
  cxp              = var.cxp
  enabled          = var.enabled
  failover_cxps    = var.failover_cxps
  gcp_region       = var.gcp_region
  gcp_vpc_id       = var.gcp_vpc_id
  gcp_vpc_name     = var.gcp_vpc_name
  group            = data.alkira_group.group.name
  name             = var.name
  segment_id       = data.alkira_segment.segment.id
  size             = var.size

  gcp_routing {
    custom_prefix    = var.gcp_routing.custom_prefix
    prefix_list_ids  = local.pfx_id_list
  }

  dynamic "vpc_subnet" {
    for_each = {
      for o in var.vpc_subnet : o.id => o
    }

    content {
      fq_id  = vpc_subnet.value.id
      cidr   = vpc_subnet.value.cidr
    }

  }

}