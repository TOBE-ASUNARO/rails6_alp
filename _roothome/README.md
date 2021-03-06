# 以下をコピペで実行。開発できる環境になると思います。
①
```shell
cd && cat atonose.txt >> /rails_app/Gemfile && cd /rails_app/ && bundle install && rails webpacker:install
```

質問が一つあり、コンフリクト、上書きするか？は、yesでお願いします。

②
そのあと、exit で、コンテナの外にでて、ドッカーイメージの再buildまで。
```shell
docker-compose build rails
```

③
さあ、はじめしょう。シェルは、4種類。下、3つのどれかでしょう。
docker-compose exec rails ash
docker-compose exec rails bash
docker-compose exec rails zsh
docker-compose exec rails fish

④
なお、shellは、メジャーどころを入れてあります。
fishは私の色で、設定をいろいろ、してあります。
