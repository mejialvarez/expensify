class ExpensesController < ApplicationController
  def index
    @tab = :expenses
    @expenses = Expense.all.order(created_at: :desc)
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_params)
  end

  private
    def expense_params
      params.require(:expense).permit(:transaction_type, :date, :concept, :category_id, :amount)
    end
end
