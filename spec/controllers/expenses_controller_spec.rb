require 'rails_helper'

describe ExpensesController do
  describe 'GET #new' do
    it "assigns a new Expense to @expense" do
      xhr :get, :new, format: :js
      expect(assigns(:expense)).to be_a_new(Expense)
    end

    it "renders the :new template" do
      xhr :get, :new, format: :js
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new expense in the database" do
        category = create(:category)
        expect{
          xhr :post, :create, format: :js, expense: attributes_for(:purchase, category_id: category.id)
        }.to change(Expense, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new expense in the database" do
        expect{
          xhr :post, :create, format: :js,
            expense: attributes_for(:invalid_expense)
        }.not_to change(Expense, :count)
      end
    end
  end
end