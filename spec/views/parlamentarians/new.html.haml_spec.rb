require 'rails_helper'

RSpec.describe "parlamentarians/new", type: :view do
  before(:each) do
    assign(:parlamentarian, Parlamentarian.new(
      name: "MyString",
      id_register: "MyString",
      num_portfolio: "MyString",
      num_legislature: "MyString",
      uf: "MyString",
      political_party: "MyString",
      cod_legislature: "MyString"
    ))
  end

  it "renders new parlamentarian form" do
    render

    assert_select "form[action=?][method=?]", parlamentarians_path, "post" do

      assert_select "input[name=?]", "parlamentarian[name]"

      assert_select "input[name=?]", "parlamentarian[id_register]"

      assert_select "input[name=?]", "parlamentarian[num_portfolio]"

      assert_select "input[name=?]", "parlamentarian[num_legislature]"

      assert_select "input[name=?]", "parlamentarian[uf]"

      assert_select "input[name=?]", "parlamentarian[political_party]"

      assert_select "input[name=?]", "parlamentarian[cod_legislature]"
    end
  end
end
