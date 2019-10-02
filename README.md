# 各種ノード運用のための環境構築

※GitHub Actions の設定ができ次第このレポジトリはPrivateにします。

## ディレクトリ構成

新しくノードを立てたい場合は以下のディレクトリ構造に従ってファイルを配置してください
```
-- mainnet/
    -- 任意のお名前/
      -- Dockerfile
      -- docker-compose.yml
      -- entrypoint.sh (必要であれば)
-- testnet/
    -- 任意のお名前/
      -- Dockerfile
      -- docker-compose.yml
      -- entrypoint.sh (必要であれば)

```

<br>

## ワークフロー

### 通常の流れ

1. 新しくブランチを切り、任意の変更を適用します
2. masterに対してプルリクエストを作成します
3. プルリクエストが通ったら GitHub Actions が稼働します
4. GitHub Actions は、デプロイ対象ホストに当リポジトリの内容をまるっとデプロイします
5. デプロイ対象ホストはデプロイを検知し、よしなにプロセスの再起動を行います（この辺の定義はこちら）

<br>

## 設定すべき環境変数

### ノード運用に必要なもの

| Key | Purpose | Value (example) |
| --- | ------- | --------------- |
| YAMALABO_NODE_USER | BTC RPC User | rpcuser |
| YAMALABO_NODE_PASS | BTC RPC Pass | rpcpass |

### デプロイに必要なもの

| Key | Purpose | Value (example) |
| --- | ------- | --------------- |
| YAMALABO_UBUNTU_HOSTS | デプロイ対象ホスト | 192.168.1.100,192.168.1.101 |
| YAMALABO_UBUNTU_USER | ログインユーザー | username |
| YAMALABO_UBUNTU_PASS | ログインパスワード | password |
