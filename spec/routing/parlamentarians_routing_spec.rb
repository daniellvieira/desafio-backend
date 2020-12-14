require "rails_helper"

RSpec.describe ParlamentariansController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/parlamentarians").to route_to("parlamentarians#index")
    end

    it "routes to #new" do
      expect(get: "/parlamentarians/new").to route_to("parlamentarians#new")
    end

    it "routes to #show" do
      expect(get: "/parlamentarians/1").to route_to("parlamentarians#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/parlamentarians/1/edit").to route_to("parlamentarians#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/parlamentarians").to route_to("parlamentarians#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/parlamentarians/1").to route_to("parlamentarians#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/parlamentarians/1").to route_to("parlamentarians#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/parlamentarians/1").to route_to("parlamentarians#destroy", id: "1")
    end
  end
end
