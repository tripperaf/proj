variable "project" {
    description = "name of the project"
}

variable "environment" {
    description = "name of the environment"
}

variable "allow_admin_create_user_only" {
    description = "whether to allow only admin to create user"
    default = true
}

variable "common_tags" {
    description = "common tags to map"
    type = map
}
