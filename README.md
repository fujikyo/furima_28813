# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------        | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| full_width_name | string  | null: false |
| half_size_name  | string  | null: false |
| birthday        | integer | null: false |


### Association

- has_many :purchases
- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| item_name     | string     | null: false                   |
| explanation   | text       | null: false                   |
| price         | integer    | null: false                   |
| category      | string     | null: false                   |
| status        | string     | null: false                   |
| charges       | string     | null: false                   |
| area          | string     | null: false                   |
| days_for      | string     | null: false                   |
| user_id       | references | null: false, foreign_key: true|
| purchase_id   | references | null: false, foreign_key: true|
 ### Association

- belongs_to :users
- has_one :purchases

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| municipality  | string     | null: false                    |
| street_number | string     | null: false                    |
| building_name | string     | null: false                    |
| phone         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :users

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| purchsed | boolean    | null: false                    |
| items_id | references | null: false, foreign_key: true |
| user_id  | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :items