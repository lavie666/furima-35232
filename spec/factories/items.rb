FactoryBot.define do
  factory :item do
    name               {'ラーメン'}
    description        {'美味しい'}
    price              {900}
    category_id        {3}
    item_status_id     {3}
    delivery_charge_id {3}
    prefecture_id      {3}
    shipping_day_id    {3}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
