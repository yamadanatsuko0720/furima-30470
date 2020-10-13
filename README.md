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
| birthday         | date   | null: false |

### Association
- has_many :item
- has_one :item_transaction



## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------|
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| condition        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| preparation_day  | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :item_transaction



## item_transactions テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------|
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :sending_destination



## sending_destinationテーブル
| Column            | Type       | Options                        |
| ------------------| ---------- | -------------------------------|
| post_code         | string     | null: false                    |
| prefecture_id     | integer    | null: false, foreign_key: true |
| city              | string     | null: false                    |
| house_number      | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | string     | null: false                    |
| item_transaction  | references | null: false, foreign_key: true |

### Association
- belongs_to :item_transaction
- belongs_to_active_hash :prefecture

