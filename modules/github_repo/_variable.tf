variable "name" {
  type        = string
  description = "リポジトリ名"
}

variable "description" {
  type        = string
  description = "リポジトリ説明"
}

variable "gitignore_template" {
  type        = string
  description = ".gitignoreファイルテンプレート名"
  default     = null
}

variable "topics" {
  type        = list(string)
  description = "Topic情報"
  default     = null
}

variable "default_branch" {
  type        = string
  description = "既定のブランチ名"
}

variable "repo_type" {
  type        = string
  description = "リポジトリのタイプ（terraform or app）"

  validation {
    condition     = var.repo_type == "terraform" || var.repo_type == "app"
    error_message = "repo_type can only be terraform or app"
  }
}

variable "first_commit_author" {
  type        = string
  description = "リポジトリ作成をトリガーする人のメールアドレス"

  validation {
    condition     = can(regex("^\\S+@\\S+\\.\\S+$", var.first_commit_author))
    error_message = "The email address is not in a valid format"
  }
}