# enju-example

https://github.com/next-l/enju_leaf/wiki/Install

## 前提
1. Visual Studio Code
    * [GitHub Codespaces](https://marketplace.visualstudio.com/items?itemName=GitHub.codespaces) 拡張機能が有効

## 利用方法
1. Visual Studio Codeを開く。
1. コマンドパレットを開く。
    * Windows: <kbd>Shift</kbd> + <kbd>Ctrl</kbd> + <kbd>P</kbd>
    * Mac: <kbd>shift</kbd> + <kbd>command</kbd> + <kbd>P</kbd>
2. `Create New Codespace...`か`Connect Codespace...`を選択
3. ターミナルを開く。
    * Windows: <kbd>Ctrl</kbd> + <kbd>@</kbd>
    * Mac: <kbd>command</kbd> + <kbd>@</kbd>
4. enjuを起動する。
    * 初回起動時は`bash enju_setup.sh`を打って<kbd>Enter</kbd>
    * 2回目以降は`docker compose up -d`を打って<kbd>Enter</kbd>
6. ブラウザで`http://127.0.0.1:8080/`を開く
