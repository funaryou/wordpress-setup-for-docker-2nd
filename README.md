# WordPress Docker 環境構築（試作）

このリポジトリは Docker で WordPress の環境構築ができるものの試作です。

## 使い方

リポジトリをクローンしたら、以下のコマンドを実行してください：

```bash
docker compose build
docker compose up
```

## データベース設定について

環境構築後、従来の WordPress のインストール手順に従って進めていくと、データベースの設定を求められます。

以下の画像のように設定してください：

![データベース設定画面](https://private-user-images.githubusercontent.com/182734145/453827560-3dc9b948-7828-43cc-b42b-4da7b1396cbe.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDk2MzE3MTksIm5iZiI6MTc0OTYzMTQxOSwicGF0aCI6Ii8xODI3MzQxNDUvNDUzODI3NTYwLTNkYzliOTQ4LTc4MjgtNDNjYy1iNDJiLTRkYTdiMTM5NmNiZS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNjExJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDYxMVQwODQzMzlaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT00MjAxNTBlMzU2OGQwNzA1MjE3MjM0MzRkNzg4NDAzMjdiNjM1ZGY5MmUwNjcwNmYzNzBlMWNlNDY5NDg3NTEyJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.yxZIF0GdsKxQmucUbJnJ5oxPgvquL5-27CQfD4rpQGM)

> ※画像は任意のパスに置き換えてください。

---

## アップロード上限の変更方法

初期状態では、ファイルのアップロード上限は **64MB** に設定されています。

この値を変更したい場合は、`Dockerfile` の以下の内容の64Mの部分を任意のサイズに変更し、再度buildをしなおせば適応されます。：

```dockerfile
RUN echo "upload_max_filesize = 64M\npost_max_size = 64M" > /usr/local/etc/php/conf.d/conf.ini
```



