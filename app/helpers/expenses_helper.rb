module ExpensesHelper
  def transaction_types
    Expense.transaction_types.inject({}) do |hash, elem|
      hash.merge!(elem.first => t("expenses.transaction_types.#{elem.first.gsub(' ','_')}"))
    end
  end

  def expense_successful_message(expense)
    "#{t("expenses.transaction_types.#{expense.transaction_type}")} por <strong>#{number_to_currency(expense.amount, unit: 'COP')}</strong> en <strong>#{l(expense.date, format: '%B %d').capitalize}</strong> fue creada satisfactoriamente"
  end
end
