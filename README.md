



## usersテーブル

| Column               | Type       | Options                    |
| -------------------- | ---------- | -------------------------- |
| nickname             | string     | null: false                |
| encrypted_password   | string     | null: false                |
| email                | string     | null: false, unique: true  |
| phone_number         | string     | null: false                |
| last_name            | string     | null: false                |
| first_name           | string     | null: false                |
| last_name_kana       | string     | null: false                |
| first_name_kana      | string     | null: false                |



### Association

- has_many :items
- has_many :rooms
- has_many :room_users
- has_many :boards
- has_many :board_users
- has_many :chat_messages
- has_many :board_messages

## itemsテーブル
| Column          | Type       | Options      |
| --------------- | ---------- | ------------ |
| item_name       | string     | null: false  |
| category_id     | integer    | null: false  |
| price           | integer    | null: false  |
| item_status_id  | integer    | null: false  |
| information     | text       | null: false  |
| inner_diameter_id  | integer    | null: false  |
| outer_diameter_id  | integer    | null: false  |
| user            | references | null: false, foreign_key: true  |



### Association

- belongs_to :user
- has_one_attached :image


## roomsテーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| user          | references | null: false, foreign_key: true  |
| item          | references | null: false, foreign_key: true  |
| name          | string     | null: false                     |

### Association

- has_many :users, through: :room_users
- has_many :messages, dependent: :destroy
- has_many :room_users, dependent: :destroy


## room_usersテーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| room          | references | null: false, foreign_key: true  |
| user          | references | null: false, foreign_key: true  |

### Association

- belongs_to :room
- belongs_to :user

## chat_messagesテーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| room          | references | null: false, foreign_key: true  |
| user          | references | null: false, foreign_key: true  |
| content       | string     | null: false                     |

### Association

- belongs_to :room
- belongs_to :user


## boarsテーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| user          | references | null: false, foreign_key: true  |
| item          | references | null: false, foreign_key: true  |
| name          | string     | null: false                     |

### Association

- has_many :users, through: :room_users
- has_many :messages, dependent: :destroy
- has_many :room_users, dependent: :destroy


## board_usersテーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| room          | references | null: false, foreign_key: true  |
| user          | references | null: false, foreign_key: true  |

### Association

- belongs_to :room
- belongs_to :user

## board_messagesテーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| room          | references | null: false, foreign_key: true  |
| user          | references | null: false, foreign_key: true  |
| content       | string     | null: false                     |

### Association

- belongs_to :room
- belongs_to :user