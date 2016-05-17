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

require 'rails_helper'

describe Expense do
  it 'has a valid factory' do
    category = build(:category)
    expect(build(:purchase, category: category)).to be_valid
  end

  it { is_expected.to belong_to(:category) }
  it { is_expected.to define_enum_for(:transaction_type).with Expense.transaction_types.keys }
  it { is_expected.to validate_presence_of :date }
  it { is_expected.to allow_value(Faker::Date.forward(1)).for :date }
  it { is_expected.to validate_presence_of :concept }
  it { is_expected.to validate_presence_of :category }
  it { is_expected.to validate_presence_of :amount }
  it { is_expected.to validate_numericality_of(:amount).is_greater_than_or_equal_to 1 }
end
