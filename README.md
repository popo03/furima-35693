# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | null: false |
| family_name      | string  | null: false |
| first_name kana  | string  | null: false |
| family_name kana | string  | null: false |
| birthday_year    | integer | null: false |
| birthday_month   | integer | null: false |
| birthday_day     | integer | null: false |

### Association

- has_many :items
- has_one  :shipping


## items テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| product_name | string     | null: false                    |
| description  | text       | null: false                    |
| category     | integer    | null: false                    |
| status       | integer    | null: false                    |
| burden       | integer    | null: false                    |
| area         | integer    | null: false                    |
| date         | integer    | null: false                    |
| price        | string     | null: false                    |
| fee          | references | null: false, foreign_key: true |
| profit       | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column                | Type       | Options                        |
| ----------------------| ---------- | ------------------------------ |
| image                 | references | null: false, foreign_key: true |
| product_name          | references | null: false, foreign_key: true |
| price                 | references | null: false, foreign_key: true |
| burden                | references | null: false, foreign_key: true |
| total_fee             | references | null: false, foreign_key: true |
| card_number           | string     | null: false                    |
| expiration_date_month | integer    | null: false                    |
| expiration_date_year  | integer    | null: false                    |
| security_code         | string     | null: false                    |
| item_id               | references | null: false, foreign_key: true |

### Association

belongs_to :item
has_one    :shipping


## shippings テーブル

| Column                | Type       | Options                        |
| ----------------------| ---------- | ------------------------------ |
| postal_code           | string     | null: false                    |
| prefecture            | integer    | null: false                    |
| city                  | string     | null: false                    |
| house_number          | string     | null: false                    |
| building_name         | string     |                                |
| call_number           | string     | null: false                    |
| user_id               | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :order