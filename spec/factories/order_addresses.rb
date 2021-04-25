FactoryBot.define do
  factory :order_address do
    post_code        {'123-4567'}
    prefecture_id    {3}
    city             {'新宿'}
    house_num        {'歌舞伎町123'}
    phone_num        {'09012345678'}
    token            {"tok_abcdefghijk00000000000000000"}

  end
end
