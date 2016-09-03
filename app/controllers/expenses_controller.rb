class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update]

  def index
    @tab = :expenses
    @expenses = Expense.all.order(created_at: :desc)
  end

  def new
    @expense = Expense.new
  end

  def edit
  end

  def create
    @expense = Expense.create(expense_params)
  end

  def update
    @expense.update(expense_params)
  end

  private

    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:id, :transaction_type, :date, :concept, :category_id, :amount)
    end
end
