require 'rails_helper'

RSpec.describe "expenses/show", type: :view do
  before(:each) do
    @expense = assign(:expense, Expense.create!(
      parlamentarian: nil,
      provider: "Provider",
      value: "9.99",
      url_document: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Provider/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
  end
end
