module ExpensesHelper

  def details_expense(expense)
    "#{l(expense.date_issue)} - #{expense.provider} - #{number_to_currency(expense.value)}"
  end
end
