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

variable "topics" {
  type        = list(string)
  default     = []
  description = "(Optional) The list of topics of the repository."
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
    username   = string
    permission = string
  }))
  default     = []
  description = "Association information of the collaborators in the repository."
}

# CodeOwner
variable "codeowner" {
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
    reviewers = object({
      teams = list(string)
      users = list(string)
    })
    secrets = list(object({
      name      = string
      encrypted = bool
      value     = string
    }))
    protected_branches_only = bool
  }))
  default     = []
  description = "Environment definition for the repository. If not defined, then use default"
}

# Branch protections
variable "branch_protections" {
  type = list(object({
    id                      = string // Any random identifier
    pattern                 = string
    enforce_admins          = optional(bool)
    required_signed_commits = optional(bool)
    required_linear_history = optional(bool)
    required_status_check = optional(object({
      strict   = optional(bool)
      contexts = optional(list(string))
    }))
    required_pull_request_reviews = optional(object({
      dismiss_stale_reviews           = optional(bool)
      require_code_owner_reviews      = optional(bool)
      required_approving_review_count = number
    }))
    allow_deletions    = optional(bool)
    allow_force_pushes = optional(bool)
  }))
  default = [
    {
      id      = "production"
      pattern = "master"
      required_pull_request_reviews = {
        required_approving_review_count = 1
        require_code_owner_reviews      = true
      }
    },
    {
      id                    = "staging"
      pattern               = "release/*"
      allow_deletions       = true
    },
    {
      id      = "development"
      pattern = "develop"
    }
  ]
  description = "Branch protection information. If not defined then use default."
}
