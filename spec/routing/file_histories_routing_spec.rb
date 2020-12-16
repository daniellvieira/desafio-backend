require "rails_helper"

RSpec.describe FileHistoriesController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/file_histories").to route_to("file_histories#create")
    end
  end
end
