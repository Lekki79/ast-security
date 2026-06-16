#!/bin/bash
set -e

REPO_URL="https://github.com/Lekki79/ast-security.git"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "📁 Папка з файлами: $SCRIPT_DIR"
echo ""

# Configure git identity if not set
git config --global user.name 2>/dev/null || git config --global user.name "Lekki79"
git config --global user.email 2>/dev/null || git config --global user.email "smconsul.in@gmail.com"

cd "$SCRIPT_DIR"

# Init repo
if [ ! -d ".git" ]; then
  git init
  git branch -M main
fi

# Set remote
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_URL"

# Stage all files
git add index.html *.jpg

echo ""
echo "📦 Файли для завантаження:"
git status --short

git commit -m "🚀 АСТ сайт — перший реліз" 2>/dev/null || git commit --allow-empty -m "update"

echo ""
echo "🔐 Зараз з'явиться запит логіна GitHub."
echo "   Username: Lekki79"
echo "   Password: введи свій Personal Access Token (не пароль!)"
echo "   Як отримати токен → github.com/settings/tokens → Generate new token (classic)"
echo "   Потрібні права: repo ✅"
echo ""

git push -u origin main --force

echo ""
echo "✅ ГОТОВО! Сайт завантажено на GitHub."
echo ""
echo "🌐 Залишився останній крок — увімкнути GitHub Pages:"
echo "   1. Відкрий: https://github.com/Lekki79/ast-security/settings/pages"
echo "   2. Branch → main → / (root) → Save"
echo "   3. Через 1-2 хвилини сайт буде живий:"
echo "      https://lekki79.github.io/ast-security/"
echo ""
