<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.28.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.28.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_branch_default.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_repository.repos](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_file.code](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.pipeline](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_branch"></a> [default\_branch](#input\_default\_branch) | 既定のブランチ名 | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | リポジトリ説明 | `string` | n/a | yes |
| <a name="input_gitignore_template"></a> [gitignore\_template](#input\_gitignore\_template) | .gitignoreファイルテンプレート名 | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | リポジトリ名 | `string` | n/a | yes |
| <a name="input_repo_type"></a> [repo\_type](#input\_repo\_type) | リポジトリのタイプ（terraform or app） | `string` | n/a | yes |
| <a name="input_topics"></a> [topics](#input\_topics) | Topic情報 | `list(string)` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->