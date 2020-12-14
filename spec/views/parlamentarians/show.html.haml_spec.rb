require 'rails_helper'

RSpec.describe "parlamentarians/show", type: :view do
  before(:each) do
    @parlamentarian = assign(:parlamentarian, Parlamentarian.create!(
      name: "Name",
      id_register: "Id Register",
      num_portfolio: "Num Portfolio",
      num_legislature: "Num Legislature",
      uf: "Uf",
      political_party: "Political Party",
      cod_legislature: "Cod Legislature"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Id Register/)
    expect(rendered).to match(/Num Portfolio/)
    expect(rendered).to match(/Num Legislature/)
    expect(rendered).to match(/Uf/)
    expect(rendered).to match(/Political Party/)
    expect(rendered).to match(/Cod Legislature/)
  end
end
