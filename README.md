# Com-app

## アプリケーション概要
- ログインしているユーザーは案内板を投稿することが出来ます。
- ログインしているユーザーは案内板にメッセージを投稿することが出来ます。

## URL
デプロイ済みのURL:[com-app-32991](https://com-app-32991.herokuapp.com/)

## テスト用アカウント
- 案内板投稿用 メールアドレス(test@sample.com) パスワード(test10310test)
- メッセージ投稿用 メールアドレス(test@example.com) パスワード(test01301)

## 利用方法
- アクセスするとイベントやサークル活動の案内板を閲覧出来ます。
- 新規会員登録をして、ログインしているユーザーは、案内板を投稿することが可能となり、イベントやサークル活動の勧誘が出来ます。
- 新規会員登録をして、ログインしているユーザーは、投稿されている案内板に、メッセージを送信することが可能となり、案内板の投稿者にコンタクトが取れます。

## 目指した課題解決
- 現代社会において情報が多すぎるため自分が興味がある趣味情報が分かりにくく探しにくい、また安心して利用出来るサイトなのかが不安という課題があります。
その課題を解決するために、キーワード検索を出来るようにして、情報量を絞ることによって必要な情報を取得しやすくします。また、新規会員登録をしないと案内板の投稿やメッセージ送信を出来ないため、セキュリティーを強化しています。

## 洗い出した要件	
- 機能完成後に追加します。

## 実装した機能についてのGIFと説明
- 機能完成後追加致します。

## 実装予定の機能
- 案内板の編集・削除機能の実装
- アクセスの制限をする
- 案内板のキーワード検索機能の実装
- メールでのやりとりができるようにする

## データベース設計
![ER図](/app/assets/images/com-app.png) 


## ローカルでの動作方法
- 機能完成後追加致します。


# テーブル設計

## users テーブル

| Column              | Type     | Options                    |
| ------------------- | -------- | -------------------------- |
| nickname            | string   | null: false                |
| email               | string   | null: false, unique: true  |
| encrypted_password  | string   | null: false                |
| age_id              | integer  | null: false                |
| sex_id              | integer  | null: false                |
| profession          | string   | null: false                |

### Association
- has_many :guides
- has_many :messages

## guides テーブル

| Column              | Type        | Options                    |
| ------------------- | ----------- | -------------------------- |
| title               | string      | null: false                |
| content             | text        | null: false                |
| notice              | text        |                            |
| user                | references  | foreign_key: true          |

### Association
- belongs_to :user
- has_many   :messages

## messages テーブル

| Column              | Type        | Options                    |
| ------------------- | ----------- | -------------------------- |
| comment             | text        | null: false                |
| user                | references  | foreign_key: true          |
| guide               | references  | foreign_key: true          |

### Association
- belongs_to :user
- belongs_to :guide