現場で使えるRuby on Rails 5 速習実践ガイド

## 構成 
Windows10　Pro
WSL Ubuntu 18.04.4
ruby 2.5.7
Rails 5.2.4.2
Node v12.16.1
PostgreSQL
slime
rspec
Bootstrap
kaminari

## 動作
![taskleaf_description](https://user-images.githubusercontent.com/56783072/79686666-1a2e8280-827d-11ea-95df-eeacad90aba0.gif)


### 事前準備
`sudo service postgresql start` でDBの起動を実施しておく.
非同期処理ツールはSidekiqを利用。
サンプル用として設定しているので、タスクcreate処理で実行されるようになっている。
なので、DBと同様にRedisサーバを起動している必要がある。
`redis-server`


### 補足
標準のERBテンプレートエンジンではなく、slimを利用。  

Rubyに必要なパッケージのインストール
`sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev`
E: Unable to locate package libgdbm6
エラーになったので、検索すると、https://github.com/rbenv/ruby-build/issues/1211
Ubuntuのバージョンによる問題だとある。https://packages.ubuntu.com/search?keywords=libgd　　のリンク先があったので、パッケージ名で確認。
WSLのバージョン18.0.4に合わせて、libgdbm6　を5に変えて実行。
`sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev`



テストコードによるテストで、失敗した場合はtmp/screenshotsにキャプチャされる
※rspecではテスト実行時に警告やエラーが発生した。Gemファイルに回避方法を記載。
Windowsでは、chromedriver.exeを用意してテストを実施。

postgresqlのtaskleafユーザパスワードは＊＊＊に修正。

添付した画像は以下のサイトから
https://find47.jp/


