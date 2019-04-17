variable "repositories" {
  type        = "list"
  description = "list of repositories"
  default     = []
}

variable "team_name" {
  type        = "string"
  description = "The name of the team you want to create"
  default = ""
}

variable "team_description" {
  type        = "string"
  description = "The description of the team you want to create"
  default = ""
}

variable "team_privacy" {
  type        = "string"
  description = "The privacy of the team you want to create"
  default     = "closed"
}

variable "admin_users" {
  type        = "list"
  description = "Admin users"
  default     = []
}

variable "merger_users" {
  type        = "list"
  description = "Users that can merge"
  default     = []
}

variable "write_only_users" {
  type        = "list"
  description = "Users that can only open a pull request"
  default     = []
}

variable "cross_repos_permissions" {
  description = "Admin permissions for cross repoes"
  default = true
}

variable "role" {
  type = "string"
  description = "Role in the organization"
  default = "member"
}
