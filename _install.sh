#!/bin/sh

# このファイルに（_install.sh）に実行権限をあたえ、実行してください

# rails_app に移動
cd rails_app


#mkdir tmp && cd tmp && mkdir pids && cd pids && touch server.pid && cd ../..
#mkdir config && cd config && touch database.yml && cd ..


# rails_appというDockerイメージを作成します。
docker build -t rails_app .

# docker上に、rails new . で、railsアプリひな形作成
# 今回はMarriaDB(MySQL)をデータベースに利用するため-database=mysqlのオプションを追加します。
# なお、-Bはbundle installを省略するオプションです。
docker run --rm rails_app -v $PWD:/rails_app rails new . -B --database=mysql

# Ruby on Railsからデータベースへ接続するための設定ファイルが作成されますので、以下のように修正します。
# config/database.yml
# -  password:   
# +  password: pass # MYSQL_ROOT_PASSWORDと同じにする（後述）★
# -  host: localhost
# +  host: db　# MySQLのコンテナ名と同じにする（後述）★

# 編集ファイルconfig/database.ymlをconfig/database.yml.bakとバックアップのうえ、
# すでに作成しておいたファイル_を上書きする。
sudo mv config/database.yml ../rails_app/config/database.yml.bak
sudo cp ../_install_tmp/database.yml ../rails_app/config/

# Ruby on Railsが起動するDockerイメージを作成していく
# Docker環境で起動したアプリケーションに外部からアクセスをする場合、
#『0.0.0.0』と指定をしないとアクセスできないので気をつけてください。
# （Docker環境のlocalhostとローカル環境のlocalhostは指すものが違うため。）
# rails server -b 0.0.0.0
# dockerfileに追加、entrypoit.shは、＃をとる処理。
echo -e '' >> ../rails_app/Dockerfile
echo -e '# entrypoint.sh に記述とします。' >> ../rails_app/Dockerfile
echo -e '# Start the main process.' >> ../rails_app/Dockerfile
echo -e '# CMD ["rails", "server", "-b", "0.0.0.0"]' >> ../rails_app/Dockerfile
#sed -e 's/#rails/rails/' ../rails_app/entrypoint.sh
# 準備ができたのでdocker-composeコマンドを利用してビルド
sudo docker-compose build
docker-compose up -d

# dbデータベース作成
docker-compose exec rails rake db:create
# でーたべーすが、出来たか確認。
# docker-compose exec db mysql -uroot -ppassword
# show databases; 

# アクセスできると思います .。
# http://localhost:3000/

