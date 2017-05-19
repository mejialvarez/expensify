module ExpensesHelper
  def expense_successful_message(expense, action)
    "The #{expense.transaction_type} <strong>#{expense.concept.humanize}</strong> for <strong>$#{number_to_currency(expense.amount, unit: '')}</strong> on <strong>#{expense.date.strftime('%B %d').capitalize}</strong> was #{action} successfully!"
  end

  def category_filters(categories)
    category_list = ""
    categories.each do |category|
      category_list += render partial: 'expenses/category_filter', locals: { category: category }
    end
    category_list.html_safe
  end

  def transaction_type_filters(types)
    transaction_type_list = ""
    types.each do |name, id|
      transaction_type_list += render partial: 'expenses/transaction_type_filter', locals: { transaction_type_name: name, transaction_type_id: id }
    end
    transaction_type_list.html_safe
  end

  def month_filters
    month_list = ""
    (0..12).each do |month_number|
      month_list += render partial: 'expenses/month_filter', locals: { month: month_number }
    end
    month_list.html_safe
  end

  def current_month_filter(month)
    month_current = month.to_i.month.ago
    "#{l(month_current, format: '%b').capitalize} #{l(month_current, format: '%Y')}"
  end

  def active_class(param_val, filter_val)
    (param_val == filter_val) ? 'active' : ''
  end
end
