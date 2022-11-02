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
- has_one :buyer

## itemsテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| product_name  | string     | null: false                    |
| concept       | text       | null: false                    |
| category      | integer    | null: false                    |
| condition     | integer    | null: false                    |
| product_price | integer    | null: false                    |
| charge_price  | integer    | null: false                    |
| deadline      | integer    | null: false                    |
| area          | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- has_one :record

## recordsテーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| buy_record | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :buyer
- has_one :item

## buyersテーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture       | integer    | null: false                    |
| city             | string     | null: false                    |
| building_name    | string     |                                |
| address          | string     | null: false                    |
| telephone_number | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| record           | references | null: false, foreign_key: true |

### Association

- belongs_to :records
- has_one :user