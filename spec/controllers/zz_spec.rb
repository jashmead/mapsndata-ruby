require 'spec_helper'

describe MapsController do

  describe "DELETE destroy" do
  # This should return the minimal set of attributes required to create a valid
  # Map. As you add validations to Map, be sure to
  # adjust the attributes here as well.
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_attributes) { { "user_id" => user.id, "name" => "Test Map #1", "map_type" => "blank" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MapsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

    it "destroys the requested map" do
      map = Map.create! valid_attributes
      expect {
        delete :destroy, {:id => map.to_param}, valid_session
      }.to change(Map, :count).by(-1)
    end

    it "redirects to the maps list" do
      map = Map.create! valid_attributes
      delete :destroy, {:id => map.to_param}, valid_session
      response.should redirect_to(maps_url)
    end
  end

end
