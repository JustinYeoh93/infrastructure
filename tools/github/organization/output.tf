output "teams_id" {
  value       = {
    for k, v in github_team.teams : v.name => v.id
  }
  description = "description"
}

output "members_id" {
  value = {
    for k, v in data.github_user.all : k => v.id
  }
}