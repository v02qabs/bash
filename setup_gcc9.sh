#!/bin/bash
set -e

echo "=== GCC-9 amd64 手動インストールスクリプト開始 ==="

# 1. 作業用の安全な一時フォルダ作成
WORK_DIR=$(mktemp -d -t gcc9-install-XXXXXX)
cd "$WORK_DIR"
echo "[1/4] 作業用フォルダを作成しました: $WORK_DIR"

# 2. archive.ubuntu.com から必要な全 .deb を取得
echo "[2/4] archive.ubuntu.com から全 .deb パッケージをダウンロード中..."

URL_BASE="http://archive.ubuntu.com/ubuntu/pool/main"

# 依存ライブラリ群
wget -q --show-progress "${URL_BASE}/g/gcc-9/gcc-9-base_9.3.0-10ubuntu2_amd64.deb"
wget -q --show-progress "${URL_BASE}/i/isl/libisl22_0.22.1-1_amd64.deb" || true
wget -q --show-progress "${URL_BASE}/g/gmp/libgmp10_6.2.0+dfsg-4_amd64.deb" || true
wget -q --show-progress "${URL_BASE}/m/mpfr4/libmpfr6_4.0.2-1_amd64.deb" || true
wget -q --show-progress "${URL_BASE}/m/mpc/libmpc3_1.1.0-1_amd64.deb" || true

# ビルドツール & gcc 本体
wget -q --show-progress "${URL_BASE}/b/binutils/binutils-x86-64-linux-gnu_2.34-6ubuntu1_amd64.deb" || true
wget -q --show-progress "${URL_BASE}/g/gcc-9/libgcc-9-dev_9.3.0-10ubuntu2_amd64.deb"
wget -q --show-progress "${URL_BASE}/g/gcc-9/gcc-9_9.3.0-10ubuntu2_amd64.deb"

# 3. dpkg で依存関係を考慮しつつ一括インストール
echo "[3/4] パッケージをインストールしています (sudo パスワードが求められます)..."
sudo dpkg -i *.deb || sudo apt-get install -f -y

# 4. 後処理
cd /tmp
rm -rf "$WORK_DIR"

echo "[4/4] 完了しました！"
echo "---------------------------------"
gcc-9 --version
echo "---------------------------------"
