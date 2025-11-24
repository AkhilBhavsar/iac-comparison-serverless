variable "function_name" {
  type = string
}

variable "s3_bucket" {
  type = string
}

variable "s3_key" {
  type = string
}

variable "handler" {
  type    = string
  default = "index.handler"
}

variable "runtime" {
  type    = string
  default = "nodejs18.x"
}

variable "table_name" {
  type = string
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "owner_tag" {
  type = string
}