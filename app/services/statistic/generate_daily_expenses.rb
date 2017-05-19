class Statistic::GenerateDailyExpenses
  def initialize(expenses)
    @expenses = expenses
  end

  def call
    expenses_by_transaction_type = {}
    Expense.transaction_types.keys.each do |type|
      expenses_by_transaction_type[type] = expenses_by_day(type)
    end
    expenses_by_transaction_type
  end

  private
    def expenses_by_day(transaction_type)
      expenses_by_day = []
      @expenses.group_by{ |e| [e.transaction_type, e.date.day] }
      .select { |group, expenses| group[0] == transaction_type }
      .each do |group, expenses|
        expenses_by_day << { y: expenses.map(&:amount).inject(0, &:+).to_i, label: group[1] }
      end
      expenses_by_day
    end

end