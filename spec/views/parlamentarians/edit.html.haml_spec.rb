require 'rails_helper'

RSpec.describe "parlamentarians/edit", type: :view do
  before(:each) do
    @parlamentarian = assign(:parlamentarian, Parlamentarian.create!(
      name: "MyString",
      id_register: "MyString",
      num_portfolio: "MyString",
      num_legislature: "MyString",
      uf: "MyString",
      political_party: "MyString",
      cod_legislature: "MyString"
    ))
  end

  it "renders the edit parlamentarian form" do
    render

    assert_select "form[action=?][method=?]", parlamentarian_path(@parlamentarian), "post" do

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
