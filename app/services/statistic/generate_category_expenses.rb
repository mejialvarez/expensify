class Statistic::GenerateCategoryExpenses
  def initialize(expenses)
    @expenses = expenses
  end

  def call
    category_expenses = []
    @expenses.group(:category).count.each do |category, size|
      category_expenses << {  y: size, label: category.name }
    end
    category_expenses
  end
end