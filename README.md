## usersテーブル

| Column              | Type   | Options                  |
| ----------          | ------ | ---------                | 
| nick_name           | string | null: false              |
| email               | string | null: false, unique: true|
| encrypted_password  | string | null: false              |     
| first_name          | string | null: false              |          
| last_name           | string | null: false              |         
| first_name_katakana | string | null: false              | 
| last_name_katakana  | string | null: false              |         
| birthday            | date   | null: false              | 



### Association
- has_many :items
- has_many :buys_histories

## itemsテーブル

| Column             | Type        | Options           |
| ----------         | ----------- | ---------         |
| name               | string      | null: false       |
| description        | text        | null: false       |
| price              | integer     | null: false       |
| category_id        | integer     | null: false       |
| item_status_id     | integer     | null: false       |
| delivery_charge_id | integer     | null: false       |
| prefecture_id      | integer     | null: false       |
| shipping_day_id    | integer     | null: false       |
| user               | references  | foreign_key: true |

### Association
- belongs_to :user
- has_one    :buys_history

## buys_historiesテーブル

| Column     | Type       | Options           |
| ---------- | -----------| ---------         |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |
         
       

### Association
- belongs_to :item
- belongs_to :user
- has_one    :shipping_address

## shipping_addressテーブル

| Column        | Type       | Options           |
| ----------    | ------     | ---------         |
| post_code     | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| house_num     | string     | null: false       |            
| building      | string     |                   |          
| phone_num     | string     | null: false       |         
| buys_history  | references | foreign_key: true |     



### Association
- belongs_to :buys_history
