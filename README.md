## usersテーブル

| Column              | Type   | Options    |
| ----------          | ------ | ---------  |
| nick_name           | string | NOT NULL   |
| email               | string | unique:true|
| encrypted_password  | string | NOT NULL   |            
| first_name          | string | NOT NULL   |          
| last_name           | string | NOT NULL   |         
| first_name(katakana)| string | NOT NULL   | 
| last_name(katakana) | string | NOT NULL   |         
| birthday            | date   | NOT NULL   | 



### Association
- has_many :items
- has_many :buys_histories

## itemsテーブル

| Column          | Type        | Options           |
| ----------      | ----------- | ---------         |
| item_name       | string      | NOT NULL          |
| description     | text        | NOT NULL          |
| price           | integer     | NOT NULL          |
| category        | string      | NOT NULL          |
| item_status     | string      | NOT NULL          |
| delivery_charge | integer     | NOT NULL          |
| shipping_from   | string      | NOT NULL          |
| shipping_day    | integer     | NOT NULL          |
| user            | references  | foreign_key: true |

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

| Column     | Type       | Options           |
| ---------- | ------     | ---------         |
| post_code  | string     | NOT NULL          |
| prefectures| string     | NOT NULL          |
| city       | string     | NOT NULL          |
| house_num  | string     | NOT NULL          |            
| building   | string     |                   |          
| phone_num  | string     | NOT NULL          |         
| item       | references | foreign_key: true |     
| user       | references | foreign_key: true |


### Association
- belongs_to :buys_history
