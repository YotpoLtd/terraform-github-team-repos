resource "github_membership" "org_membership" {
  count = "${length(local.all_users)}"
  username = "${local.all_users[count.index]}"
  role = "${var.role}"
}

resource "github_team" "team" {
  count = "${length(var.repositories) != 0 ? 1 : 0}"
  name        = "${var.team_name}-admins"
  description = "${var.team_description}"
  privacy = "${var.team_privacy}"
  parent_team_id = "${github_team.mergers_team.id}"
}

resource "github_team_membership" "team_membership" {
  count = "${length(var.admin_users)}"
  team_id  = "${github_team.team.id}"
  username = "${var.admin_users[count.index]}"
}

resource "github_team_repository" "team_repos" {
  count = "${length(var.repositories)}"
  team_id    = "${github_team.team.id}"
  repository = "${var.repositories[count.index]}"
  permission = "admin"
}

resource "github_team_repository" "team_cross_repos" {
  count = "${var.cross_repos_permissions ? length(local.all_repos) : 0}"
  team_id    = "${github_team.team.id}"
  repository = "${local.all_repos[count.index]}"
  permission = "admin"
}

resource "github_team" "mergers_team" {
  count = "${length(var.write_only_users) != 0 ? 0 : 1}"
  name        = "${var.team_name}"
  description = "Users that can merge"
  privacy = "${var.team_privacy}"
}

resource "github_team_membership" "mergers_team_membership" {
  count = "${length(var.merger_users)}"
  team_id = "${github_team.mergers_team.id}"
  username = "${var.merger_users[count.index]}"
}

locals {
  cross_repos =  []
  all_repos = "${concat(var.repositories, local.cross_repos)}"
  all_users = "${concat(var.admin_users, var.merger_users, var.write_only_users)}"
}
