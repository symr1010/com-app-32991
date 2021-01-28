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



