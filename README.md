# PE-demo

## Terraformインストール
[公式ドキュメント](https://developer.hashicorp.com/terraform/install?product_intent=terraform) を参照

## コマンド集
### Terraformのコードを実行する
```bash
cd samples

# GitHubリポジトリを作成する場合は環境変数 TF_VAR_github_token にGitHubのパーソナルアクセストークンを設定しておく
export TF_VAR_github_token=<自身のGitHub パーソナルアクセストークン>

terraform init --upgrade
terraform plan
terraform apply -auto-approve
```

### モジュールの説明資料を自動作成する
```bash
# server machineモジュールの例
cd modules/server_machine/
terraform-docs markdown table --output-file README.md --output-mode inject ./
```
