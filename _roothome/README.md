# 以下をコピペで実行。開発できる環境になると思います。
①
cd && cat atonose.txt >> /rails_app/Gemfile && cd /rails_app/ && bundle install && rails webpacker:install

質問が一つあり、コンフリクト、上書きするか？は、yesでお願いします。

②
そのあと、ドッカーイメージの再buildまで。

③
さあ、はじめしょう。