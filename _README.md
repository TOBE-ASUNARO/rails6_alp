インストール方法

①
_install.shに、実行権限を与えて、実行

②
起動までいたり、doneが2つでて、3分くらいで、3行くらいメッセ-ジでます。それから、イメージ内を設定。
```shell
docker-compose exec rails ash
```
で、コンテナに入り、

③
cd
とタイプ。ホームdｉｒへ移動。Ｒｅａｄｍｅどうりに。コマンドを実行。yesの上書きして、exit
（なおcloneして出来ている、_roothomeの中身と同じになっています。こっちを読んでもいい。）

④
```shell
docker-compose build rails
```
でイメージを再ビルドで完成。