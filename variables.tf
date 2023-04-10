variable "billing_tags" {
  description  = "Billing tags associated with connector"
  type         = list(string)
  default      = []
}

variable "credential" {
  description  = "Name of credential to use for onboarding VPC"
  type         = string
}

variable "cxp" {
  description  = "CXP to provision connector in"
  type         = string
}

variable "enabled" {
  description  = "Status of connector"
  type         = bool
  default      = true
}

variable "failover_cxps" {
  description = "List of CXPs where connector should be provisioned for failover"
  type        = list(string)
  default     = []
}

variable "group" {
  description  = "Group to associate with connector"
  type         = string
  default      = ""
}

variable "gcp_region" {
  description  = "GCP region"
  type         = string
}

variable "gcp_routing" {
  description  = "Routing options for VPC"

  type = object({
    custom_prefix  = optional(string, "ADVERTISE_DEFAULT_ROUTE")
    prefix_lists   = optional(list(string), [])
  })
  default = {}
}

variable "gcp_vpc_id" {
  description  = "ID of GCP VPC that is being connected"
  type         = string
}

variable "gcp_vpc_name" {
  description  = "Name of GCP VPC that is being connected"
  type         = string
}

variable "name" {
  description  = "Name of connector"
  type         = string
}

variable "segment" {
  description  = "Segment to provision connector in"
  type         = string
}

variable "size" {
  description  = "Size of connector"
  type         = string
  default      = "SMALL"
}

variable "vpc_subnet" {
  description = "Subnets to onboard in place of entire VPC CIDR block"

  type = list(object({
    id    = optional(string)
    cidr  = optional(string)
  }))
  default = []
}