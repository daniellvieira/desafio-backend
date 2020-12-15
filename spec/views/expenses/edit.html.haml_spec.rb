require 'rails_helper'

RSpec.describe "expenses/edit", type: :view do
  before(:each) do
    @expense = assign(:expense, Expense.create!(
      parlamentarian: nil,
      provider: "MyString",
      value: "9.99",
      url_document: "MyText"
    ))
  end

  it "renders the edit expense form" do
    render

    assert_select "form[action=?][method=?]", expense_path(@expense), "post" do

      assert_select "input[name=?]", "expense[parlamentarian_id]"

      assert_select "input[name=?]", "expense[provider]"

      assert_select "input[name=?]", "expense[value]"

      assert_select "textarea[name=?]", "expense[url_document]"
    end
  end
end
