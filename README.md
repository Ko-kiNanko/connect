# connect

## 概要
医療従事者と医療部材提供の業者が簡単に情報交換ができるアプリ

## URL

## テスト用アカウント

## 利用方法

## 制作背景
前職で医療関係の仕事を働いていた時に、最新の医療機器の情報や必要な部材の準備などで業者の人が病院に頻回に訪問してくださり、その都度情報をいただいたり、こちらからも情報を提供してどんな部材が必要かというやりとりをして治療行為がスムーズに回っていた。しかし昨年コロナ禍となり業者の出入りや不要な立ち入りが禁止されて情報交換する機会が減ってしまった。医療は新しい部材がたくさん出てきてすぐにバージョンアップしていくのがより良い医療行為につながっている。その中でスタッフの知識のアップデートも必ず必要と確信しており、こういった人が会えない状況下でも手軽に情報を交換できるシステムが欲しいと感じた為に作成に至った。

## 要件定義
### ①ユーザー管理機能
#### ユーザー管理して、情報の管理権限をつける  誰とチャットしたいか選択できる

## 実装予定

## データベース設計

## ローカルでの動作方法

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