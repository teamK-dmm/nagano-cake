#🍰Nagano-cake🍰

このサイトは2022年2月生のチーム開発で作成しました。

```
$ git clone https://github.com/teamK-dmm/nagano-cake.git
$ cd nagano-cake
$ rails db:seed
$ rails db:migrate
$ bundle install
$ rails webpacker:install
$ rails webpacker:compile
$ rails s

```
#🍭管理者情報🍬
ジャンル、商品の登録等は[管理者ログインページ](http://localhost:3000/admin/sign_in)より、
メールアドレス：a@a
パスワード：aaaaaa
を入力してログインしてください。

#🍮実装機能🍮
- public
  - 会員登録・編集・退会
  - 商品の閲覧・カートに入れる・注文
  - ジャンル検索
  - 注文履歴の確認
  - 検索機能

- admin
  - ジャンル登録・編集・非表示選択
  - 商品の登録・編集・削除・非表示選択
  - 注文履歴の確認・進捗ステータスの変更
  - 会員情報の確認・編集
  - 検索機能


短い間でしたが、ありがとうございました！

🍩小島より