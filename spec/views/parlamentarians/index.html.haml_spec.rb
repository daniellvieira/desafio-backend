require 'rails_helper'

RSpec.describe "parlamentarians/index", type: :view do
  before(:each) do
    assign(:parlamentarians, [
      Parlamentarian.create!(
        name: "Name",
        id_register: "Id Register",
        num_portfolio: "Num Portfolio",
        num_legislature: "Num Legislature",
        uf: "Uf",
        political_party: "Political Party",
        cod_legislature: "Cod Legislature"
      ),
      Parlamentarian.create!(
        name: "Name",
        id_register: "Id Register",
        num_portfolio: "Num Portfolio",
        num_legislature: "Num Legislature",
        uf: "Uf",
        political_party: "Political Party",
        cod_legislature: "Cod Legislature"
      )
    ])
  end

  it "renders a list of parlamentarians" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Id Register".to_s, count: 2
    assert_select "tr>td", text: "Num Portfolio".to_s, count: 2
    assert_select "tr>td", text: "Num Legislature".to_s, count: 2
    assert_select "tr>td", text: "Uf".to_s, count: 2
    assert_select "tr>td", text: "Political Party".to_s, count: 2
    assert_select "tr>td", text: "Cod Legislature".to_s, count: 2
  end
end
