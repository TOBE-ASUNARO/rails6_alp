# ruby:3.0.0のDockerイメージをベースとして利用
FROM ruby:3.0.0-alpine3.12

# イメージ構築の際、必要な環境変数を定義（ただし、../.envが優先されるはず）
# ソフトインストール
# 作業ディレクトリを/rails_appに
# TZ設定
# Rails HOST/PORT

# ---------環境で、書き換えを--------
# for MAC
ENV RUNTIME_PACKAGES "gcc g++ libc-dev libxml2-dev linux-headers vim git bash zsh curl openssh openssl openssl-dev make yarn mysql-dev mariadb-client tzdata nodejs"

# for win
# ENV RUNTIME_PACKAGES "gcc g++ libc-dev libxml2-dev linux-headers exa fd ripgrep vim git tmux bash zsh fish fzf curl openssh openssl openssl-dev make yarn mysql-dev mariadb-client tzdata nodejs"
# --------------------------------

ENV DEV_PACKAGES "build-base curl-dev"
ENV APP_HOME /rails_app
ENV TZ Asia/Tokyo

ENV HOST 0.0.0.0
ENV PORT 3000

# 作業ディレクトリを/rails_appに実際に指定
WORKDIR ${APP_HOME}

# ローカルのGemfileをDokcerにコピー
ADD Gemfile ${APP_HOME}/Gemfile
ADD Gemfile.lock ${APP_HOME}/Gemfile.lock

# ADD webpacker.yml ${APP_HOME}/config/

#/rails_appディレクトリ上でbundle install
RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache ${RUNTIME_PACKAGES} \
    && apk add --update --no-cache --virtual=.build-dependencies ${DEV_PACKAGES} \
    && bundle install --jobs=4 \
    && yarn install \
    && rm -rf /usr/local/bundle/cache/*.gem \
        && find /usr/local/bundle/gems/ -name "*.c" -delete \
        && find /usr/local/bundle/gems/ -name "*.o" -delete \
    && apk del --purge .build-dependencies \
    && rm -rf /var/cache/apk/ && mkdir /var/cache/apk/ 
#    && curl -fsSL https://starship.rs/install.sh | bash -s -- --yes
#    && rails webpacker:install

COPY . ${APP_HOME}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]


EXPOSE ${PORT}
