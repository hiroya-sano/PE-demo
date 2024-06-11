resource "github_repository" "repos" {
  name        = var.name
  description = var.description
  visibility  = "private"
  auto_init   = true

  has_downloads = true
  has_issues    = true
  has_projects  = true
  has_wiki      = true

  gitignore_template = var.gitignore_template
  topics             = var.topics

  vulnerability_alerts = true

  lifecycle {
    ignore_changes = [
      auto_init,
    ]
  }
}


resource "github_branch_default" "default" {
  repository = github_repository.repos.name
  branch     = var.default_branch
}


locals {
  initial_files_tmp = {
    "terraform" = {
      pipeline = {
        files = [
          {
            path    = "./.github/workflow/gitleaks.yml"
            content = file("${path.module}/files/terraform/pipeline/gitleaks.yml")
          },
          {
            path    = "./.github/workflow/terraform.yml"
            content = file("${path.module}/files/terraform/pipeline/terraform.yml")
          }
        ]
      }
      code = {
        files = [
          {
            path    = "./terraform/main.tf"
            content = ""
          }
        ]
      }
    }
    "app" = {
      pipeline = {
        files = []
      }
      code = {
        files = [
          {
            path    = "./manifest/app/ci.yaml"
            content = file("${path.module}/files/app/ci.yaml")
          },
          {
            path    = "./manifest/helm/value_cloudecho.yaml"
            content = file("${path.module}/files/app/value_cloudecho.yaml")
          }
        ]
      }
    }
  }
  initial_files = lookup(local.initial_files_tmp, var.repo_type, {})
}

resource "github_repository_file" "pipeline" {
  for_each = { for f in local.initial_files.pipeline.files : f.path => f }

  repository          = github_repository.repos.name
  branch              = github_branch_default.default.branch
  file                = each.value.path
  content             = each.value.content
  commit_message      = "Managed by Terraform"
  commit_author       = "hiroya.sano"
  commit_email        = "hiroya.sano@ulsystems.co.jp"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [file, content]
  }
}

resource "github_repository_file" "code" {
  for_each = { for f in local.initial_files.code.files : f.path => f }

  repository          = github_repository.repos.name
  branch              = github_branch_default.default.branch
  file                = each.value.path
  content             = each.value.content
  commit_message      = "Managed by Terraform"
  commit_author       = "hiroya.sano"
  commit_email        = "hiroya.sano@ulsystems.co.jp"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [file, content]
  }
}
