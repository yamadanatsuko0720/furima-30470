## users テーブル
| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| birth_date       | date   | null: false |

### Association
- has_many :items
- has_many :item_transactions



## items テーブル
| Column              | Type       | Options                        |
| --------------------| ---------- | -------------------------------|
| name                | string     | null: false                    |
| text                | text       | null: false                    |
| category_id         | integer    | null: false, foreign_key: true |
| postage_payer_id    | integer    | null: false, foreign_key: true |
| condition_id        | integer    | null: false, foreign_key: true |
| prefecture_id       | integer    | null: false, foreign_key: true |
| preparation_day_id  | integer    | null: false, foreign_key: true |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order



## orders テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------|
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address



## addressesテーブル
| Column            | Type       | Options                        |
| ------------------| ---------- | -------------------------------|
| post_code         | string     | null: false                    |
| prefecture_id     | integer    | null: false, foreign_key: true |
| city              | string     | null: false                    |
| house_number      | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | string     | null: false                    |
| order             | references | null: false, foreign_key: true |

### Association
- belongs_to :order
- belongs_to_active_hash :prefecture

