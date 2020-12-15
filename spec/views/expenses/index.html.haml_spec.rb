require 'rails_helper'

RSpec.describe "expenses/index", type: :view do
  before(:each) do
    assign(:expenses, [
      Expense.create!(
        parlamentarian: nil,
        provider: "Provider",
        value: "9.99",
        url_document: "MyText"
      ),
      Expense.create!(
        parlamentarian: nil,
        provider: "Provider",
        value: "9.99",
        url_document: "MyText"
      )
    ])
  end

  it "renders a list of expenses" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Provider".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
