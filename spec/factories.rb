FactoryBot.define do
  factory :merchant do
    name { Faker::Cosmere.herald }
  end

  factory :item do
    name { Faker::Coffee.blend_name }
    description { Faker::Coffee.notes }
    unit_price { rand(1.11..99.99).round(2) }
    merchant
  end

  factory :invoice_item do
    item
    invoice
    quantity { rand(100) }
    unit_price { rand(1.11..99.99).round(2) }
  end

  factory :transaction do
    invoice
    credit_card_number { Faker::Finance.credit_card }
    credit_card_expiration_date { Faker::Date.forward(days: 100) }
    result
  end

  factory :invoice do
    customer
    merchant
    status
  end

  factory :customer do
    first_name { Faker::Creature::Animal.name }
    last_name { Faker::Creature::Animal.name }
  end
end
