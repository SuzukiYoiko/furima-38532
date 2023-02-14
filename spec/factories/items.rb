FactoryBot.define do
  factory :item do
    product_name     { 'パソコン' }
    concept          { '3年前に購入したMacBookです' }
    category_id      { 2 }
    condition_id     { 2 }
    charge_price_id  { 2 }
    deadline_id      { 2 }
    area_id          { 2 }
    product_price    { 50000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/er.png'), filename: 'er.png')
    end
  end
end
