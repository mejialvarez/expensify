# == Schema Information
#
# Table name: expenses
#
#  id               :integer          not null, primary key
#  transaction_type :integer          not null
#  date             :date             not null
#  concept          :string           not null
#  category_id      :integer          not null
#  amount           :decimal(, )      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

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
