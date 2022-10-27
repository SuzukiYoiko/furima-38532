# テーブル設計

## usersテーブル

| Column                | Type   | Option                    |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password              | string | null: false               |
| first_name            | string | null: false               |
| last_name             | string | null: false               |
| first_kana            | string | null: false               |
| last_kana             | string | null: false               |
| birthday              | date   | null: false               |

### Association

- has_many :items
- has_many :records
- has_many :buyers

## itemsテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| product_name  | string     | null: false                    |
| concept       | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| product_price | integer    | null: false                    |
| charge_price  | integer    | null: false                    |
| deadline      | date       | null: false                    |
| area          | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## recordsテーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| buy_record | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| buyer      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buyer
- has_one :item

## buyersテーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| post_code        | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| building_name    | string     | null: false                    |
| address          | string     | null: false                    |
| telephone_number | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- has_many :records
- belongs_to :user