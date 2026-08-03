#!/bin/bash
set -e

# 一時フォルダの作成
WORKDIR=$(mktemp -d)
cd "$WORKDIR"

echo "=== GLIBC 2.33 システムインストールスクリプト ==="
echo "注意: システムが破損する可能性があるため、バックアップを推奨します。"
sleep 3

URL_BASE="http://archive.ubuntu.com/ubuntu/pool/main/g/glibc"

echo "[1/3] deb パッケージの取得中..."
wget ${URL_BASE}/libc6_2.33-0ubuntu5_amd64.deb
wget ${URL_BASE}/libc6-dev_2.33-0ubuntu5_amd64.deb
wget ${URL_BASE}/libc-bin_2.33-0ubuntu5_amd64.deb
wget ${URL_BASE}/locales_2.33-0ubuntu5_all.deb

echo "[2/3] システムへ dpkg 強制インストール中..."
sudo dpkg -i --force-overwrite *.deb || sudo apt-get install -f -y

echo "[3/3] GLIBC バージョン確認"
ldd --version | head -n 1

# クリーンアップ
cd /tmp && rm -rf "$WORKDIR"
echo "インストールが完了しました。"o
