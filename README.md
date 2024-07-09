# PE-demo

## Terraformインストール
[公式ドキュメント](https://developer.hashicorp.com/terraform/install?product_intent=terraform) を参照

## コードへの一部補足
### 手動での変更を可能とする方法
Terraformに記述することで、記述された部分は原則コードから設定変更するべきと言える。
しかし一方で、各プロダクト開発チームは、AWSコンソール画面から手動で設定変更したい場合がある。それを可能とするためには、`lifecycle.ignore_changes` を記述すれば良い。例えば `modules/server_machine/main.tf` の `aws_instance.instance_1a` のように記述することで、開発者がコンソール画面から手動でインスタンスサイズを変更しても問題なくなる。

`lifecycle.ignore_changes` を記述しなくても、権限さえあればコンソール画面から設定変更することは可能。しかし、設定変更後にTerraformコードが適用されると、手動での設定変更が元に戻ってしまう（コードに定義された設定値で上書きされる）。

> 参考：[terraform lifecycleドキュメント](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

## コマンド集
### Terraform testを実行する
`modules/server_machine/tests/test.tftest.hcl` ファイルにテストロジックを格納している
```bash
cd modules/server_machine
terraform init --upgrade
terraform test
```

> 参考：[terraform testドキュメント](https://developer.hashicorp.com/terraform/language/tests)

### モジュールの説明資料を自動作成する
```bash
# server machineモジュールの例
cd modules/server_machine/
terraform-docs markdown table --output-file README.md --output-mode inject ./
```