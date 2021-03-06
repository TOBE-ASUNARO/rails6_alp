# 以下をコピペで実行。開発できる環境になると思います。

cd && cat atonose.txt >> /rails_app/Gemfile && cd /rails_app/ && bundle install

rails webpacker:install
（overwriteは、Yで。）

そのあと、ドッカーイメージのbuildまで。