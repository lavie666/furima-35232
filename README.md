## usersテーブル

| Column     | Type   | Options  |
| ---------- | ------ | ---------|
| nick_name  | string | NOT NULL |
| email      | string | NOT NULL |
| password   | string | NOT NULL |            
| first_name | string | NOT NULL |          
| last_name  | string | NOT NULL |         
| birthday   | date   | NOT NULL |        

### Association
- has_many :items
- has_many :buys_histories

## itemsテーブル

| Column     | Type        | Options  |
| ---------- | ----------- | ---------|
| item_name  | string      | NOT NULL |
| description| text        | NOT NULL |
| price      | integer     | NOT NULL |            
| user       | references  |          |

### Association
- belongs_to :user
- has_one    :buys_histories

## buys_historiesテーブル

| Column     | Type       | Options  |
| ---------- | -----------| ---------|
| user       | references |          |
| item       | references |          |
         
       

### Association
- belongs_to :item
- belongs_to :user
- has_one    :shipping_addresses

## shipping_addressテーブル

| Column     | Type   | Options  |
| ---------- | ------ | ---------|
| post_code  | integer| NOT NULL |
| city       | string | NOT NULL |
| house_num  | string | NOT NULL |            
| building   | string |          |          
| phone_num  | integer| NOT NULL |         
      

### Association
- belongs_to :buys_histories
