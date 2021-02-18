# テーブル設計

## users　テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :orders


## orders テーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| date        | date      | null: false                    |
| amount      | integer   | null: false                    |
| category_id | integer   | null: false                    |
| memo        | string    |                                |
| user        | references| null: false, foreign_key: true |

### Association

- belongs_to :user