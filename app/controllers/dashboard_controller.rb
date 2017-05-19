class DashboardController < ApplicationController
  def index
    @tab = :dashboard

    @today_expenses = Expense.between(Date.today)
    @yesterday_expenses = Expense.between(Date.yesterday)
    @current_month_expenses = Expense.between(DateRange.month_ago)
    @last_month_expenses = Expense.between(DateRange.month_ago(1))
    last_6_month_expenses = Expense.between(DateRange.last_6_month)

    @monthly_expenses = Statistic::GenerateMonthlyExpenses.new(last_6_month_expenses).call
    @daily_expenses = Statistic::GenerateDailyExpenses.new(@current_month_expenses).call
    @category_expenses = Statistic::GenerateCategoryExpenses.new(Expense.all).call
    @cumulative_expenses = Statistic::GenerateCumulativeExpences.new(@current_month_expenses, @last_month_expenses).call
  end
end
