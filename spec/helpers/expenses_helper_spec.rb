require 'rails_helper'

describe ExpensesHelper do
  describe '#transaction_types' do
    it 'returns a hash of transaction types' do
      expect(helper.transaction_type_options).to include('purchase' => 'Compra', 'retirement' => 'Retiro', 'transfer' => 'Transferencia', 'payment' => 'Pago')
    end
  end

  describe '#expense_successful_message' do
    it 'returns a successful message' do
      expect(helper.expense_successful_message(create(:purchase, date: '2016-04-01', amount: 15000), "creada")).to eq('Compra por <strong>15.000,00 COP</strong> en <strong>Abril 01</strong> fue creada satisfactoriamente')
    end
  end
end
