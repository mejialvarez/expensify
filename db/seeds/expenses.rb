end_date = Date.today
start_date = end_date - 6.month
categories = Category.all
transaction_types = Expense.transaction_types.keys

(start_date..end_date).each do |date|
  5.times do
    expense = Expense.new
    expense.date = date
    expense.concept = Faker::Lorem.sentence
    expense.amount = Faker::Number.positive
    expense.transaction_type = transaction_types.sample
    expense.category = categories.sample

    if expense.save
      p "Created expense #{expense.id}"
    else
      p "An error occurred creating expense: #{expense.errors.messages}"
    end
  end
end