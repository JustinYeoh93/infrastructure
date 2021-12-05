# Repository related
variable "name" {
  type        = string
  description = "(Required) The name of the repository."
}

variable "description" {
  type        = string
  default     = ""
  description = "(Optional) A description of the repository."
}

variable "homepage_url" {
  type        = string
  default     = ""
  description = "(Optional) URL of a page describing the project."
}

variable "visibility" {
  type        = string
  default     = "private"
  description = "(Optional) Can be public or private. If your organization is associated with an enterprise account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+, visibility can also be internal. The visibility parameter overrides the private parameter."
}

variable "has_issues" {
  type        = bool
  default     = false
  description = "(Optional) Set to true to enable the GitHub Issues features on the repository."
}

variable "has_projects" {
  type        = bool
  default     = false
  description = "(Optional) Set to true to enable the GitHub Projects features on the repository."
}

variable "has_wiki" {
  type        = bool
  default     = false
  description = "(Optional) Set to true to enable the GitHub Wiki features on the repository."
}

variable "is_template" {
  type        = bool
  default     = false
  description = "(Optional) Set to true to tell GitHub that this is a template repository."
}

variable "allow_merge_commit" {
  type        = bool
  default     = true
  description = "(Optional) Set to false to disable merge commits on the repository."
}

variable "allow_squash_merge" {
  type        = bool
  default     = true
  description = "(Optional) Set to false to disable squash merges on the repository."
}

variable "allow_rebase_merge" {
  type        = bool
  default     = false
  description = "(Optional) Set to false to disable rebase merges on the repository."
}

variable "allow_auto_merge" {
  type        = bool
  default     = false
  description = "(Optional) Set to true to allow auto-merging pull requests on the repository."
}

variable "delete_branch_on_merge" {
  type        = bool
  default     = true
  description = "(Optional) Automatically delete head branch after a pull request is merged. Defaults to false."
}

variable "has_downloads" {
  type        = bool
  default     = false
  description = "(Optional) Set to true to enable the (deprecated) downloads features on the repository."
}

variable "auto_init" {
  type        = bool
  default     = true
  description = "(Optional) Set to true to produce an initial commit in the repository."
}

variable "gitignore_template" {
  type        = string
  default     = ""
  description = "(Optional) Use the name of the template without the extension. For example, 'Haskell'."
}

variable "license_template" {
  type        = string
  default     = ""
  description = "(Optional) Use the name of the template without the extension. For example, 'mit' or 'mpl-2.0'."
}

variable "archived" {
  type        = bool
  default     = false
  description = "(Optional) Specifies if the repository should be archived. Defaults to false. NOTE Currently, the API does not support unarchiving."
}

variable "archive_on_destroy" {
  type        = bool
  default     = true
  description = "(Optional) Set to true to archive the repository instead of deleting on destroy."
}

variable "pages" {
  type = object({
    source = object({
      branch = string
      path   = optional(string)
    })
    cname = optional(string)
  })
  default     = {}
  description = "(Optional) The repository's GitHub Pages configuration. See terraform docs for more info on how to set this up. Turned off by default."
}

variable "topics" {
  type        = list(string)
  default     = []
  description = "(Optional) The list of topics of the repository."
}

variable "template" {
  type = object({
    owner      = string
    repository = string
  })
  default     = {}
  description = "(Optional) Use a template repository to create this resource. See terraform docs for more info on how to set this up. Turned off by default."
}

variable "vulnerability_alerts" {
  type        = bool
  default     = true
  description = "(Optional) - Set to true to enable security alerts for vulnerable dependencies."
}

# Repository team
variable "teams" {
  type = list(object({
    name       = string
    permission = string
  }))
  description = "Association information of the team in the repository."
}

# Repository collaborator
variable "collaborators" {
  type = list(object({
    username   = ""
    permission = ""
  }))
  default     = []
  description = "Association information of the collaborators in the repository."
}

# CodeOwner
variable "codeowners" {
  type        = string
  default     = ""
  description = "CODEOWNERS of this repository. Usually Tech Lead will take this position. They can then fine tune it if needed."
}

# Repository Secrets
variable "repository_secrets" {
  type = list(object({
    name      = string
    encrypted = bool
    value     = string
  }))
  default     = []
  description = "List of secrets at repository level."
}

# Environments
variable "environments" {
  type = list(object({
    name = string
    reviewers = list(object({
      teams = list(string)
      users = list(string)
    }))
    secrets = list(object({
      name      = string
      encrypted = bool
      value     = string
    }))
    protected_branches_only = true
  }))
  default     = []
  description = "Environment definition for the repository."
}

# Default branch name
variable "default_branch" {
  type        = string
  default     = ""
  description = "The name of the default branch of the repository."
}

# Branch protections
variable "branch_protections" {
  type = list(object({
    pattern                 = string
    enforce_admins          = bool
    required_signed_commits = bool
    required_linear_history = bool
    required_status_check = object({
      strict   = bool
      contexts = list(string)
    })
    required_pull_request_reviews = object({
      dismiss_stale_reviews           = bool
      restrict_dismissals             = bool
      require_code_owner_reviews      = bool
      required_approving_review_count = number
    })
  }))
  default     = []
  description = "Branch protection information"
}
