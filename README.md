# Petstore

## 🌱 このプロジェクトについて

このプロジェクトはバックエンドに Spring Boot を、フロントエンドに React を採用したプロジェクトの OpenAPI Generator を活用した開発手法のサンプルです。

API のサンプルとして <https://editor.swagger.io> の Petstore 3.0 を利用します。

## ⚙️ 環境構築

このプロジェクトは以下の環境を要求します。

- バックエンド
  - Java（OpenAPI Generator が必要とする）
- フロントエンド
  - Java（OpenAPI Generator が必要とする）
  - Python（npm モジュールが必要とする）
  - make（npm モジュールが必要とする）
  - gcc（npm モジュールが必要とする）
  - g++（npm モジュールが必要とする）
- フロントエンドとバックエンドの結合
  - Docker
  - Docker Compose

サポートする OS は Windows と macOS です。
以下にそれぞれの OS の環境構築方法を示します。
各環境には IntelliJ IDEA と Visual Studio Code がインストールされているものとします。

### Windows ❖

1. WSL2 で Ubuntu を導入
1. Ubuntu 上に Docker Compose 環境を構築

    ```shell-session
    $ sudo apt update -y
    ...
    $ sudo apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    ...
    $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    ...
    $ echo \
        "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ...
    $ sudo apt update -y
    ...
    $ sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose
    ...
    $ getent group docker
    docker:x:999:
    $ sudo gpasswd -a $USER docker
    ...
    $ getent group docker
    docker:x:999:<YOUR-USER-NAME>
    $
    ```

1. Ubuntu を再起動
1. WSL から Visual Studio Code が起動できるように修正

    ```shell-session
    $ echo 'export PATH=$PATH:"/mnt/c/Users/<YOUR-USER-NAME>/AppData/Local/Programs/Microsoft VS Code/bin"' >> ~/.bashrc
    $ exec -l $SHELL
    $
    ```

1. npm、node をインストール

    ```shell-session
    $ git clone https://github.com/nodenv/nodenv.git ~/.nodenv
    ...
    $ echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
    $ echo 'eval "$(nodenv init -)"' >> ~/.bashrc
    $ exec -l $SHELL
    $ git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build
    ...
    $
    ```

1. Node.js 18.16.0 をインストール

    ```shell-session
    nodenv install 18.16.0
    ...
    $
    ```

1. ssh 設定をシンボリックリンク

    ```shell-session
    $ cd
    $ ln -s /mnt/c/Users/<YOUR-USER-NAME>/.ssh/ .
    $
    ```

1. .gitconfig をシンボリックリンク

    ```shell-session
    $ cd
    $ ln -s /mnt/c/Users/<YOUR-USER-NAME>/.gitconfig .
    $
    ```

1. Git リポジトリをクローン

    ```shell-session
    $ git clone git@github.com:satosystems/petstore.git
    ...
    $ cd petstore
    $
    ```

1. フロントエンド開発（のモジュールのビルド）に必要なツールをインストール

    ```shell-session
    $ sudo apt install openjdk-17-jdk build-essential python3
    ...
    $
    ```

### macOS 

1. <https://brew.sh/> の手順に従って Homebrew をインストール
2. 必要なツールをインストール

    ```shell-session
    $ brew install openjdk@17 nodenv
    ...
    $ brew install --cask docker
    ...
    $ nodenv install 18.16.0
    ...
    $
    ```

## 🚀 実行

以下コマンド相当で OpenAPI の定義を修正します。

```shell-session
$ sed -i -e 's|https://petstore3.swagger.io/api/v3|http://localhost/api/v3|' spec/petstore.yaml
$
```

これを行わないと生成されたフロントエンドコードが <https://petstore3.swagger.io/api/v3> を参照しに行きます（これはこれでフロントエンド開発に便利なため変更をコミットしていません）。
変更後は生成されたフロントエンドコードが <http://localhost/api/v3> を参照しに行きます。

以下の手順で OpenAPI からコードを自動生成しておきます。

```shell-session
$ npm ci
...
$ cd frontend
$ npm ci
...
$ npm run gen
...
$
```

コードの自動生成は、バックエンドは Java コンパイル直前に、フロントエンドはあらかじめ生成しておくという方法で行います。
ですので、上記手順でバックエンドのコード生成を行っていないのは適切です。

以下の手順でコンテナを起動します。

```shell-session
$ docker compose up
...
```

別のターミナルを開いて、以下のコマンドでバックエンドとフロントエンドを起動します。

```shell-session
$ npm run dc:exec
...
```

ブラウザで <http://localhost> を開きます。

データベースの状態を確認する場合はブラウザで <http://localhost/h2-console> を開きます。
