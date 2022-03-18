variable "db_user" {
    description = "RDS user name"
    type        = string
    sensitive   = true
}

variable "db_password" {
    description = "RDS user password"
    type        = string
    sensitive   = true
}

variable "availability_zone" {
    type        = string
    default     = "eu-west-2a"
}