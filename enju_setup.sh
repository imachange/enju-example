#!/bin/bash

# スクリプトの実行中にエラーが発生した場合、即座に終了する
set -e

# enju_leaf ディレクトリに移動
cd enju_leaf

# .env ファイルをコピー
echo "=> .envファイルをコピー中..."
cp .env.template .env

# Docker Composeをビルド
echo "=> Dockerイメージをビルド中..."
docker compose build

# SECRET_KEY_BASEを生成し、.envファイルに追加
echo "=> SECRET_KEY_BASEを生成中..."
SECRET_KEY_BASE=$(docker compose run --rm web bin/rails secret)
echo "SECRET_KEY_BASE=$SECRET_KEY_BASE" >> .env

# Dockerコンテナを起動
echo "=> Dockerコンテナを起動中..."
docker compose up -d

# データベースの準備（マイグレーションなど）
echo "=> データベースを準備中..."
docker compose run --rm web bin/rails db:prepare

# JavaScriptライブラリのインストール
echo "=> JavaScriptライブラリをインストール中..."
docker compose run --rm web yarn install

# アセットのプリコンパイル
echo "=> アセットをプリコンパイル中..."
docker compose run --rm web bin/rake assets:precompile

# Sunspot（検索インデックス）の再構築
echo "=> Sunspotインデックスを再構築中..."
docker compose run --rm web bin/rake sunspot:reindex

# コンテナを一度停止し、再起動
echo "=> コンテナを再起動中..."
docker compose down
docker compose up -d

echo "=> セットアップが完了しました！"