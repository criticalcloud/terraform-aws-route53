variable "standalone_records" {
  type    = list(map(any))
  default = []
}

variable "zones" {
  type    = list(map(any))
  default = []
}