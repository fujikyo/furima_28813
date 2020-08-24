# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------        | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| firstname_hira  | string  | null: false |
| lastname_hira   | string  | null: false |
| firstname_kana  | string  | null: false |
| lastname_kana   | string  | null: false |
| birthday        | date    | null: false |


### Association

- has_many :purchases
- has_many :items

## items テーブル

| Column                       | Type       | Options                       |
| ---------------------------- | ---------- | ----------------------------- |
| name                         | string     | null: false                   |
| explanation                  | text       | null: false                   |
| price                        | integer    | null: false                   |
| category_id(active_hash)     | integer    | null: false                   |
| status_id(activehash)        | integer    | null: false                   |
| charges_id(activehash)       | integer    | null: false                   |
| area_id(activehash)          | integer    | null: false                   |
| days_for_id(activehash)      | integer    | null: false                   |
| user                         | references | null: false, foreign_key: true|
 ### Association

- belongs_to :user
- has_one :purchase

## orders テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| postal_code               | string     | null: false                    |
| prefecture_id(activehash) | integer    | null: false                    |
| municipality              | string     | null: false                    |
| street_number             | string     | null: false                    |
| building_name             | string     |                                |
| phone                     | string     | null: false                    |
| purchase                  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| items  | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |


### Association
- has_one :order
- belongs_to :user
- belongs_to :item