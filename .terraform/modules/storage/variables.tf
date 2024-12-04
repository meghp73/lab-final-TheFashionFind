variable "db_instance_type" {
  description = "The instance type for the RDS database"
  type        = string
}

variable "subnet_ids" {
  description = "List of public subnet IDs for the DB subnet group"
  type        = list(string)
}
