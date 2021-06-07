# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name kana    | string | null: false               |
| family_name kana   | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| product_name  | string     | null: false                    |
| description   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| burden_id     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| date_id       | integer    | null: false                    |
| price         | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one    :shipping



## shippings テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| call_number   | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

belongs_to :order