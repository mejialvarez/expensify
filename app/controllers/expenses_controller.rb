class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update, :destroy]

  def index
    @tab = :expenses
    @categories = Category.all
    @transaction_types = Expense.transaction_types

    @expenses = Expense.between(DateRange.month_ago(params[:month_ago]))
    @expenses = @expenses.by_category(params[:category]) if params[:category].present?
    @expenses = @expenses.by_transaction_type(params[:transaction_type]) if params[:transaction_type].present?
    @expenses = @expenses.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.js
    end
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

  def destroy
    @expense.destroy
  end

  private

    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:id, :transaction_type, :date, :concept, :category_id, :amount)
    end
end
