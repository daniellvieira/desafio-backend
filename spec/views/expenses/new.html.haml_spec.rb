require 'rails_helper'

RSpec.describe "expenses/new", type: :view do
  before(:each) do
    assign(:expense, Expense.new(
      parlamentarian: nil,
      provider: "MyString",
      value: "9.99",
      url_document: "MyText"
    ))
  end

  it "renders new expense form" do
    render

    assert_select "form[action=?][method=?]", expenses_path, "post" do

      assert_select "input[name=?]", "expense[parlamentarian_id]"

      assert_select "input[name=?]", "expense[provider]"

      assert_select "input[name=?]", "expense[value]"

      assert_select "textarea[name=?]", "expense[url_document]"
    end
  end
end
