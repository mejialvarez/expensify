FactoryGirl.define do
  factory :expense do
    association :category

    date { Faker::Date.forward(1) }
    concept { Faker::Lorem.sentence }
    amount { Faker::Commerce.price }

    factory :purchase do
      transaction_type 0
    end

    factory :retirement do
      transaction_type 1
    end

    factory :transfer do
      transaction_type 2
    end

    factory :payment do
      transaction_type 3
    end

    factory :invalid_expense do
      category nil
      date nil
      concept nil
      amount nil
      transaction_type nil
    end
  end
end
