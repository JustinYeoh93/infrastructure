output "teams" {
  value       = github_team.teams
  sensitive   = true
  description = "description"
  depends_on  = []
}
