require "spec_helper"

# a number of requests are done by redirecting to an appropriately named map, see spec/requests/redirects_spec.rb for these

describe MapsController do
  describe "routing" do

    it "routes to #index" do
      get("/maps").should route_to("maps#index")
    end

    it "routes to #new" do
      get("/maps/new").should route_to("maps#new")
    end

    it "routes to #show" do
      get("/maps/1").should route_to("maps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/maps/1/edit").should route_to("maps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/maps").should route_to("maps#create")
    end

    it "routes to #update" do
      put("/maps/1").should route_to("maps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/maps/1").should route_to("maps#destroy", :id => "1")
    end

    it "routes to #named_map when given a name" do
      get("/maps/test_map").should route_to("maps#named_map", :name => "test_map")
    end

  end
end
