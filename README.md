# terminal-hands-on-docker

## dockerをインストールする
- [Get Docker](https://docs.docker.com/get-docker/)を参考に、dockerをインストールします。

## dockerイメージをローカルに落とす
github container registryからイメージを取得する

```bash
docker pull ghcr.io/saw012/terminal-hands-on-docker:main
```

## dockerイメージを実行する
```bash
docker run -it ghcr.io/saw012/terminal-hands-on-docker:main zsh
```

## ハンズオンの内容を実施する
★sudo権限が必要なinstall系は済んでいます。
