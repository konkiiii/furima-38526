# テーブル設計

## users テーブル

| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| nickname            | string | null: false              |
| email               | string | null: false, unique:true |
| encrypted_password  | string | null: false              |
| family_name         | string | null: false              |
| first_name          | string | null: false              |
| family_name_kana    | string | null: false              |
| first_name_kana     | string | null: false              |
| birth_day           | date   | null: false              |

### Asociation
- has_many :products
- has_one :purcheses

## products テーブル
| Column                   | Type    | Options                  |
| ------------------------ | ------- | ------------------------ |
| product_name             | string  | null: false              |
| description              | text    | null: false              |
| category_genre_id        | integer | null: false              |
| condition_genre_id       | integer | null: false              |
| delivery_charge_genre_id | integer | null: false              |
| prefectures_genre_id     | integer | null: false              |
| days_to_ship_genre_id    | integer | null: false              |
| price                    | integer | null: false              |

### Asociation
- belongs_to :user

## purchasesテーブル
| Column               | Type      | Options                      |
| -------------------- | --------- | ---------------------------- |
| user                 | reference | null: falseforeign_key: true |
| postal_code          | string    | null: false                  |
| prefectures_genre_id | integer   | null: false                  |
| municipalities       | string    | null: false                  |
| address              | string    | null: false                  |
| building             | string    |                              |
| phone_number         | string    | null: false                  |

### Asociation
- belongs_to :user