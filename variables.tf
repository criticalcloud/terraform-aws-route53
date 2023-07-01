variable "standalone_records" {
  type    = list(map(any))
  default = []
}

variable "zones" {
  type    = list(map(any))
  default = []
}

variable "cf_domain" {
  type        = list
  default     = [""]
  description = "CF domain"
}
