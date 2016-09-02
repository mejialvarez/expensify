require 'rails_helper'

describe ExpensesController do
  describe 'GET #index' do
    it 'assigns :expenses to @tab' do
      get :index
      expect(assigns(:tab)).to eq(:expenses)
    end

    context 'without params' do
      it 'populates an array of all expenses sorted by created date' do
        purchase = create(:purchase)
        payment = create(:payment)
        get :index
        expect(assigns(:expenses)).to eq([payment, purchase])
      end
    end
  end

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