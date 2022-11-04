# テーブル設計

## usersテーブル

| Column                | Type   | Option                    |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| first_name            | string | null: false               |
| last_name             | string | null: false               |
| first_kana            | string | null: false               |
| last_kana             | string | null: false               |
| birthday              | date   | null: false               |

### Association

- has_many :items
- has_many :records

## itemsテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| product_name    | string     | null: false                    |
| concept         | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| product_price   | integer    | null: false                    |
| charge_price_id | integer    | null: false                    |
| deadline_id     | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :record

## recordsテーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer
- belongs_to :item

## buyersテーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| area_id          | integer    | null: false                    |
| city             | string     | null: false                    |
| building_name    | string     |                                |
| address          | string     | null: false                    |
| telephone_number | string     | null: false                    |
| record           | references | null: false, foreign_key: true |

### Association

- belongs_to :record