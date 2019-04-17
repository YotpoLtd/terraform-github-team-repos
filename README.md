# terraform-github-team-repos
A Terraform module which allows you to manage a teams's members and repositories

**Note**: this module was designed for organizations where all users have write permissions to all repos. Which means they can open a PR.


# Usgae  
```
module "anacondas-team" {
  source                                 = "github.com/YotpoLtd/terraform-github-team-repos"
  team_name                              = "Anacondas"
  team_description                       = "Anacondas team"
  repositories                           = ["example-repo"]
  admin_users                            = ["aberenshtein"]
  merger_users                           = ["merger"]   
}
```

This will create two teams:
1. Anacondas - with `merger` as a user with write permissions to example-repo
2. Anacondas-admins - with `aberenshtein` as with Admin permissions to example-repo

This will allow you to have the Anacondas as a team with merge permissions to the repository and restrict them to pass CR. Admins, amongst other things, will be able to merge to the main branch without restrictions.

This module also supports adding users to the organization and not to a specific team:
```
    module "write-only" {
      source                                 = "git::ssh://github.com/YotpoLtd/terraform-github-team-repos"
      write_only_users                       = ["someuser"]
    }

```

# Other features
* If you want to remove a user from the organization, remove him from his team or as a write_only_user and he will be removed using the github_membership resource.
* You can use the `cross_repos` variable to add repositories to all teams.  