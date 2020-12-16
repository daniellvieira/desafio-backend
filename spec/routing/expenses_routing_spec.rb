require "rails_helper"

RSpec.describe ExpensesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/parlamentarians/1/expenses").to route_to("expenses#index", parlamentarian_id: '1')
    end

    it "routes to #show" do
      expect(get: "/parlamentarians/1/expenses/1").to route_to("expenses#show", parlamentarian_id: '1', id: "1")
    end
  end
end
