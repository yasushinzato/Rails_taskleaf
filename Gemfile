source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.7'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use ActiveModel has_secure_password
# ユーザパスワードで使用する。
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # テストデータ作成支援用のFactoryBotを導入
  gem 'factory_bot_rails', '~> 4.11'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  # テストで警告が表示されるので、chromedriverの代わりにwebdriversに修正
  #gem 'chromedriver-helper'
  gem 'webdrivers', '~> 3.0'
  #https://gist.github.com/upinetree/fb71a947cc100e7918b7b280485d620c#%E5%AF%BE%E7%AD%96a-chromedriver-helper-%E3%82%92%E4%BD%BF%E3%82%8F%E3%81%9A%E3%81%AB%E8%87%AA%E5%88%86%E3%81%A7-chromedriver-%E3%82%92%E8%A8%AD%E5%AE%9A%E3%81%99%E3%82%8B
  # それでも改善されないので、chromedriverを直接DLし、参照させるように修正.
  # テスト用Gem追加.bundle実行後、`bin/rails g rspec:install` で必要なファイルを作成する
  gem 'rspec-rails', '~> 3.7'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# 標準のERBテンプレートエンジンではなく、Slimテンプレートエンジンを使用する
# 初期作成されたERBファイルを変換する。`bundle exec erb2slim app/views/layouts/ --delete`
gem 'slim-rails'
gem 'html2slim'

# CSSはBootstrapフロントエンドフレームワークを使用する
gem 'bootstrap'

# 詳細説明でURLが記述されていた場合はリンクを作成する
gem 'rails_autolink'

# 一覧画面に検索機能を追加
gem 'ransack'

# メール送信するためsmtpサーバを立てる. config/environments にメールサーバ情報を記述
# Ruby本体にインストールするときのコマンドで、[gem install mailcatcer]とする。bundleコマンドだと正常に動作しないことがあるとのこと。

# ファイルアップロード. Rails5.2からActive Storageというgemが同梱されている
# bin/rails active_storage:install コマンドでモデルを作成する

# ページを分割するページネーションを追加
gem 'kaminari'

# 非同期処理ツール、定期実行
gem 'sidekiq'

# JavaScriptのビルドツールのラッパー
gem 'webpacker'
