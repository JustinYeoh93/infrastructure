output "teams" {
  value       = github_team.teams
  description = "description"
}

output "members" {
  value = data.github_user.members
}