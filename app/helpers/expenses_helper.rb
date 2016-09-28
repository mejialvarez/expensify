module ExpensesHelper
  def transaction_types
    Expense.transaction_types.inject({}) do |hash, elem|
      hash.merge!(elem.first => t("expenses.transaction_types.#{elem.first.gsub(' ','_')}"))
    end
  end

  def expense_successful_message(expense, action)
    "#{t("expenses.transaction_types.#{expense.transaction_type}")} por <strong>#{number_to_currency(expense.amount, unit: 'COP')}</strong> en <strong>#{l(expense.date, format: '%B %d').capitalize}</strong> fue #{action} satisfactoriamente"
  end

  def category_filters
    category_list = ""
    @categories.each do |category|
      category_list += render partial: 'expenses/category_filter', locals: { category: category }
    end
    category_list += hidden_field_tag :category, params[:category]
    category_list.html_safe
  end

  def transaction_type_filters
    transaction_type_list = ""
    @transaction_types.each do |transaction_type_name, transaction_type_id|
      transaction_type_list += render partial: 'expenses/transaction_type_filter', locals: { transaction_type_name: transaction_type_name, transaction_type_id: transaction_type_id }
    end
    transaction_type_list += hidden_field_tag :transaction_type, params[:transaction_type]
    transaction_type_list.html_safe
  end

  def month_filters
    month_list = ""
    end_date = Date.today
    start_date = end_date - 335
    (start_date..end_date).step(32).reverse_each do |month|
      month_list += render partial: 'expenses/month_filter', locals: { month: month }
    end
    month_list += hidden_field_tag :month, (params[:month] || Date.today.month)
    month_list += hidden_field_tag :year, (params[:year] || Date.today.year)
    month_list.html_safe
  end

  def current_month_filter(month, year)
    date_current = Date.parse("#{year}/#{month}/01") || Date.today
    "#{l(date_current, format: '%b').capitalize} #{l(date_current, format: '%Y')}"
  end

  def active_class(param_val, filter_val)
    (param_val == filter_val) ? 'active' : ''
  end
end
