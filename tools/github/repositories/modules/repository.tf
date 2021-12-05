resource "github_repository" "repository" {
  name                   = var.name
  description            = var.description
  homepage_url           = var.homepage_url
  private                = var.private
  visibility             = var.visibility
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  is_template            = var.is_template
  allow_merge_commit     = var.allow_merge_commit
  allow_squash_merge     = var.allow_squash_merge
  allow_rebase_merge     = var.allow_rebase_merge
  delete_branch_on_merge = var.delete_branch_on_merge
  has_downloads          = var.has_downloads
  auto_init              = var.auto_init
  gitignore_template     = var.gitignore_template == "" ? null : var.gitignore_template
  license_template       = var.license_template == "" ? null : var.license_template
  archived               = var.archived
  archive_on_destroy     = var.archive_on_destroy
  pages                  = var.pages == {} ? null : var.pages
  topics                 = var.topics
  template               = var.template == {} ? null : var.template
  vulnerability_alerts   = var.vulnerability_alerts
}