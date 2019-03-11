# HIVE ModuleSystem Docker

2019.03.11

---

## 概要
HIVE(https://github.com/riken-RCCS/HIVE.git) ModuleSystem のDockerイメージです。



---

# 使い方

## 1.Dockerのインストール

### Windows の場合
下記からダウンロードし、インストールしてください。

- https://docs.docker.com/docker-for-windows/install/

### macOS の場合

下記からダウンロードし、インストールしてください。

- https://docs.docker.com/docker-for-mac/install/

### Ubunts の場合（京プリポストクラウド環境の場合）

下記のインストールスクリプトを実行してください。

    $curl -O XXXXXX/install_docker_ubuntu.sh
    $sh install_docker_ubuntu.sh


## 2.DockerHub からイメージのダウンロード

下記のコマンドを実行し、DockerHubよりイメージをダウンロードしてください。

    $docker pull hudviz/hive-modulesystem

## 3.Dockerイメージ/HIVE ModuleSystemの起動

下記のコマンドを実行し、Dockerイメージを起動してください

    $docker run -p 8080:80 --rm -t hudviz/hive-modulesystem

## 4.HIVE ModuleSystem へのアクセス

### Windows の場合
以下にアクセスしてください。
http://192.168.99.100:8080/


### macOS / Ubuntu の場合
以下にアクセスしてください。
http://localhost:8080/

