class Statistic::GenerateCumulativeExpences
  def initialize(current_month_expenses, last_month_expenses)
    @current_month_expenses = current_month_expenses
    @last_month_expenses = last_month_expenses
  end

  def call
    {
      current_month: expenses_by_day(@current_month_expenses),
      last_month: expenses_by_day(@last_month_expenses)
    }
  end

  private
    def expenses_by_day(expenses)
      expenses_by_day = []
      expenses.group_by{ |e| e.date.day }
      .each do |day, expenses|
        expenses_by_day << { y: expenses.map(&:amount).inject(0, &:+).to_i, label: day }
      end
      expenses_by_day
    end
end