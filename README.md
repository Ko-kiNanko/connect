# アプリケーション名
connect

## 概要
医療従事者と医療部材提供の業者が簡単に情報交換ができるアプリ<br>
新しい医療機器を使うときに、業者がいなくてちゃんと使えるか不安。このデバイスの情報聞かれたけど思い出せない。入社する前からあるデバイスで資料がなくて勉強する手段がない。そんな医療スタッフの悩みを解決するために情報を簡単に共有できることを考えたサービスを目指しました。

## URL

## テスト用アカウント

## 利用方法
①トップページの新規作成でアカウントを作成しサービスを使うことができる。一度アカウントを作れば次回からはログイン機能も実装しており簡単にサインインが可能です。

②ユーザー登録を済ましていると画面下部に投稿ボタンがあり、選択すると投稿画面に遷移するので必要な項目を入力すると投稿が完了し全てのユーザーが投稿情報を閲覧することができます。

③チャット機能がトップページの「チャット」ボタンからチャット画面に遷移します。「チャット作成」を押すとルーム名の指定とチャットする相手のユーザーを指定することでルームの作成ができます。<br>
作ったルームを選択するとメッセージ機能が使えるようになっています。

④トップページからログアウトが可能です。

## 制作背景
前職で医療関係の仕事を働いていた時に、最新の医療機器の情報や必要な部材の準備などで業者の人が病院に頻回に訪問してくださり、その都度情報をいただいたり、こちらからも情報を提供してどんな部材が必要かというやりとりをして治療行為がスムーズに回っていた。しかし昨年コロナ禍となり業者の出入りや不要な立ち入りが禁止されて情報交換する機会が減ってしまった。医療は新しい部材がたくさん出てきてすぐにバージョンアップしていくのがより良い医療行為につながっている。その中でスタッフの知識のアップデートも必ず必要と確信しており、こういった人が会えない状況下でも手軽に情報を交換できるシステムが欲しいと感じた為に作成に至った。

## 要件定義
### ①ユーザー管理機能
#### 目的
ユーザー管理して、情報の管理権限をつける<br>
誰とチャットしたいか選択できる
#### 詳細
ユーザー管理して、情報の編集や更新を管理し、チャット機能やメッセージ機能で誰からのメッセージが届いているか判断できるようにする。<br>
ユーザーを新しく登録できる事と、ログアウトできる。
#### ストーリー
・トップページ上部の新規登録ボタンから新規登録できる。
・チャット機能や投稿機能を使うと、loginページへ遷移する
・トップページの上部からログアウトができる

### ②商品情報機能
#### 目的
商品の情報を簡単に投稿・閲覧することができる
#### 詳細
商品（テキストとがぞう）を投稿できる<br>
商品情報を閲覧でき、納品数やカテゴリを簡単に選択できるようにする。<br>
随時情報の更新ができ、一覧表示機能も追加
#### ストーリー
・トップページの下部に表示される投稿ボタンから商品と画像を投稿できる
・商品を選択すると商品情報を閲覧できる
・商品情報のページにいくと投稿者である場合に情報の更新が随時可能
・トップページ商品の一覧表示機能

### ③チャット機能
#### 目的
ユーザー同士の連絡の簡易化
#### 詳細
個人でチャットができ、連絡ができる<br>
商品情報からチャットできるようにする。
#### ストーリー
・トップページのチャットボタンを押すとチャット画面に遷移する
・登録しているユーザーを選択してチャットルームを作ることが可能
・チャットルームに入るとチャットが可能
・選択したユーザーのみルームが表示される

### ④掲示板機能
#### 目的
ユーザー全員を対象に情報の共有ができる掲示板を作れるようになる
#### 詳細
誰でも投稿ができる<br>
投稿メッセージの後ろに名前が入る。<br>
トップページに表示
#### ストーリー
・トップページに投稿formがあり、そこから投稿可能
・最新一週間の投稿を表示
・投稿内容が誰からか表示される。

### ⑤検索機能
#### 目的
ユーザーが情報の検索を簡単化
#### 詳細
トップページからカテゴリ検索すると一覧の表示ができるようになる
#### ストーリー
・トップページ上部のカテゴリを選択すると検索が可能

### ⑥動画コンテンツの導入
#### 目的
動画コンテンツをトップページに導入できるようになる
#### 詳細
トップページに自動で動画が再生されるように設定
#### ストーリー
・トップページの動画の範囲を見ると動画コンテンツが再生される。

## 実装予定
④掲示板機能、⑤検索機能、⑥動画コンテンツの導入
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