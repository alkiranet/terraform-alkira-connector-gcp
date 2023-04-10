# Alkira GCP Connector
Terraform module that provisions [Alkira GCP Connector](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/resources/connector_gcp_vpc).

## Basic Usage
```hcl
module "connect_gcp" {
  source = "alkiranet/connector-gcp/alkira"

  name              = "connector-east"
  cxp               = "US-EAST-2"
  credential        = "gcp-credential"
  billing_tags      = ["network"]
  segment           = "business"
  group             = "cloud"
  gcp_region        = "us-east4"
  gcp_vpc_id        = "123456789"
  gcp_vpc_name      = "gcp-vpc-east"

}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_alkira"></a> [alkira](#requirement\_alkira) | >= 0.9.9 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alkira"></a> [alkira](#provider\_alkira) | >= 0.9.9 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alkira_connector_gcp_vpc.connector](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/resources/connector_gcp_vpc) | resource |
| [alkira_billing_tag.tag](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/billing_tag) | data source |
| [alkira_credential.credential](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/credential) | data source |
| [alkira_group.group](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/group) | data source |
| [alkira_policy_prefix_list.list](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/policy_prefix_list) | data source |
| [alkira_segment.segment](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/segment) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_tags"></a> [billing\_tags](#input\_billing\_tags) | Billing tags associated with connector | `list(string)` | `[]` | no |
| <a name="input_credential"></a> [credential](#input\_credential) | Name of credential to use for onboarding VPC | `string` | n/a | yes |
| <a name="input_cxp"></a> [cxp](#input\_cxp) | CXP to provision connector in | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Status of connector | `bool` | `true` | no |
| <a name="input_failover_cxps"></a> [failover\_cxps](#input\_failover\_cxps) | List of CXPs where connector should be provisioned for failover | `list(string)` | `[]` | no |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | GCP region | `string` | n/a | yes |
| <a name="input_gcp_routing"></a> [gcp\_routing](#input\_gcp\_routing) | Routing options for VPC | <pre>object({<br>    custom_prefix  = optional(string, "ADVERTISE_DEFAULT_ROUTE")<br>    prefix_lists   = optional(list(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_gcp_vpc_id"></a> [gcp\_vpc\_id](#input\_gcp\_vpc\_id) | ID of GCP VPC that is being connected | `string` | n/a | yes |
| <a name="input_gcp_vpc_name"></a> [gcp\_vpc\_name](#input\_gcp\_vpc\_name) | Name of GCP VPC that is being connected | `string` | n/a | yes |
| <a name="input_group"></a> [group](#input\_group) | Group to associate with connector | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of connector | `string` | n/a | yes |
| <a name="input_segment"></a> [segment](#input\_segment) | Segment to provision connector in | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | Size of connector | `string` | `"SMALL"` | no |
| <a name="input_vpc_subnet"></a> [vpc\_subnet](#input\_vpc\_subnet) | Subnets to onboard in place of entire VPC CIDR block | <pre>list(object({<br>    id    = optional(string)<br>    cidr  = optional(string)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connector_id"></a> [connector\_id](#output\_connector\_id) | ID of connector |
| <a name="output_implicit_group_id"></a> [implicit\_group\_id](#output\_implicit\_group\_id) | ID of implicit group automatically created with connector |
<!-- END_TF_DOCS -->