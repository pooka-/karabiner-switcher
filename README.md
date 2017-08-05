# Karabiner-Switcher

Hammerspoonを使用し、Karabiner-Elementsのプロファイルを切り替えるスクリプトです。

アプリケーションごとにプロファイルを切り替えたい時に。

## 使い方
1. Hammerspoonインストール

    ```bash
    brew cask install hammerspoon
    ```

1. Karabiner-Elementsでプロファイルを用意する

    * 例
        * Default profile
        * Caps2Control

1. $HOME/.hammerspoonディレクトリに下記ファイルを追加
    * .hammerspoon/init.lua
    * .hammerspoon/karabiner-switcher.json

1. $HOME/.hammerspoon/karabiner-switcher.jsonにルールを追加する

    ```json
    {
      "defaultProfileName": "Default profile",
      "rules": [
        {"targetName": "", "profileName": ""}
      ]
    }
    ```

    | 要素 | 説明 |
    |:- |:- |
    | defaultProfileName | デフォルトで使用するプロファイル名 |
    | targetName | アプリ名(init.luaのコメントを外すと確認可) |
    | profileName | targetNameで指定したアプリ使用時に適用するプロファイル名 |

1. Hammerspoonの`Reload Config`を実行する