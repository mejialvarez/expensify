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

class Expense < ActiveRecord::Base
  belongs_to :category

  enum transaction_type: [:purchase, :retirement, :transfer, :payment]

  VALIDATE_REGEX_DATE = /(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))/
  validates :transaction_type, inclusion: { in: transaction_types }
  validates :date, presence: true, format: { with: VALIDATE_REGEX_DATE }
  validates :concept, presence: true
  validates :category, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }

  scope :by_category, ->(category) { where(category_id: category) }
  scope :by_transaction_type, ->(transaction_type) { where(transaction_type: transaction_type) }
  scope :between, ->(range) { where(date: range) }
end
