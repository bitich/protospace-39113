# テーブル設計

## Users テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|email                     |string                    |null: false                             |
|encrypted_password        |string                    |null: false                             |
|profile                   |text                      |null: false                             |
|occupation                |text                      |null: false                             |
|position                  |text                      |null: false                             |

- has_many :prototypes
- has_many :comments

## Comments テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|content                   |text                      |null: false                             |
|prototype                 |references                |null: false, foreign_key: true          |
|user                      |references                |null: false, foreign_key: true          |

- belongs_to :users
- belongs_to :prototypes

## prototypes 
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|title                     |string                    |null: false                             |
|catch_copy                |text                      |null: false                             |
|concept                   |text                      |null: false                             |
|user                      |references                |null: false, foreign_key: true          |

- belong_to :users
- has_many :comments
