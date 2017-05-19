require 'rails_helper'

describe ExpensesHelper do
  describe '#expense_successful_message' do
    it 'returns a successful message' do
      expect(helper.expense_successful_message(create(:purchase, concept: 'test', date: '2016-04-01', amount: 15000), "created"))
      .to eq('The purchase <strong>Test</strong> for <strong>$15,000.00</strong> on <strong>April 01</strong> was created successfully!')
    end
  end
end
