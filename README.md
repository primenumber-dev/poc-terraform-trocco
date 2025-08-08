# TROCCO Terraform Infrastructure

TROCCOデータパイプラインプラットフォーム用のTerraform構成管理プロジェクト

## 初期セットアップ

### 1. 設定ファイルの準備

機密情報を含む設定ファイルをテンプレートからコピーして作成してください：

```bash
# 環境変数ファイルを作成
cp .env.dev.template .env.dev
# .env.devファイルを編集して実際のGitHubトークンを設定
# 任意：MCPサーバー接続時に必要になる

# 共通設定ファイルを作成
cp shared/common.tfvars.template shared/common.tfvars
# shared/common.tfvarsファイルを編集して実際の認証情報を設定
```

## セットアップ手順

### 1. Docker実行コマンド

標準化された環境でTerraformを実行したい場合は、Dockerを使用可能：

```bash
# Docker Composeでコンテナを起動
docker compose up -d --build

# コンテナに入ってbashを起動
docker compose exec tf bash
```


### 1. 接続設定の作成

Snowflake とS3の接続設定を作成します（一度だけ実行）：

```bash
cd projects/connection-setup
make init
make plan
make apply
make output  # 接続IDを確認
```

### 2. 通知設定の作成

メール通知設定を作成します（一度だけ実行）：

```bash
cd projects/notification-setup
make init
make plan
make apply
make output  # 通知IDを確認
```

### 3. データ転送ジョブとパイプラインの設定

データ転送ジョブとパイプラインを設定します：

```bash
cd projects/prd_103_sc
make init
make plan
make apply
```

## Makefileコマンド

各プロジェクトで利用可能なコマンド：

- `make apply` - Terraform適用（バックアップなし）
- `make plan` - 実行プランの確認
- `make init` - Terraform初期化
- `make validate` - 構成の検証
- `make fmt` - コードフォーマット
- `make state` - 状態リソース一覧
- `make rm` - 全リソースを状態から削除
- `make clean` - バックアップファイル削除
- `make output` - アウトプット値表示（connection-setup, notification-setup）
- `make destroy` - インフラ削除（バックアップなし）
