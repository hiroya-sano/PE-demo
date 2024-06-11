module "github_repo" {
  source = "../modules/github_repo"

  name           = "pe_demo_repository"
  description    = "PEのデモ用リポジトリ。デモが終了したら削除する"
  default_branch = "main"
  repo_type      = "app"
  topics         = []
}