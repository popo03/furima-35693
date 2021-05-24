# テーブル設計

## users テーブル

| Column                     | Type    | Options                   |
| -------------------------- | ------- | ------------------------- |
| nickname                   | string  | null: false               |
| email                      | string  | null: false, unique: true |
| encrypted_password         | string  | null: false               |
| first_name                 | string  | null: false               |
| family_name                | string  | null: false               |
| first_name kana            | string  | null: false               |
| family_name kana           | string  | null: false               |
| date_id                    | integer | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :shippings


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
| fee           | references | null: false, foreign_key: true |
| profit        | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| image         | references | null: false, foreign_key: true |
| product_name  | references | null: false, foreign_key: true |
| price         | references | null: false, foreign_key: true |
| burden        | references | null: false, foreign_key: true |
| total_fee     | references | null: false, foreign_key: true |
| card_number   | string     | null: false                    |
| exp_month_id  | integer    | null: false                    |
| exp_year_id   | integer    | null: false                    |
| security_code | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one    :shipping


## shippings テーブル

| Column                | Type       | Options                        |
| ----------------------| ---------- | ------------------------------ |
| postal_code           | string     | null: false                    |
| prefecture_id         | integer    | null: false                    |
| city                  | string     | null: false                    |
| house_number          | string     | null: false                    |
| building_name         | string     |                                |
| call_number           | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :order