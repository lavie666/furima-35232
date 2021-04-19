FactoryBot.define do
  factory :user do
    nick_name              {'たろう'}
    email                  {Faker::Internet.free_email}
    password               {'111aaa'}
    password_confirmation  {password}
    last_name              {'山田'}
    first_name             {'太郎'}
    last_name_katakana     {'ヤマダ'}
    first_name_katakana    {'タロウ'}
    birthday               {'2021-03-27'}
  end
end