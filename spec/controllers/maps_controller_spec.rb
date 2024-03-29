require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MapsController do

  # This should return the minimal set of attributes required to create a valid
  # Map. As you add validations to Map, be sure to
  # adjust the attributes here as well.
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_attributes) { { "user_id" => user.id, "name" => "Test Map #1", "map_type" => "blank" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MapsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all maps as @maps" do
      map = Map.create! valid_attributes
      get :index, {}, valid_session
      assigns(:maps).should eq([map])
    end
  end

  describe "GET show" do
    it "assigns the requested map as @map" do
      map = Map.create! valid_attributes
      get :show, {:id => map.to_param}, valid_session
      assigns(:map).should eq(map)
    end
  end

  describe "GET new" do
    it "assigns a new map as @map" do
      get :new, {}, valid_session
      assigns(:map).should be_a_new(Map)
    end
  end

  describe "GET edit" do
    it "assigns the requested map as @map" do
      map = Map.create! valid_attributes
      get :edit, {:id => map.to_param}, valid_session
      assigns(:map).should eq(map)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Map" do
        expect {
          post :create, {:map => valid_attributes}, valid_session
        }.to change(Map, :count).by(1)
      end

      it "assigns a newly created map as @map" do
        post :create, {:map => valid_attributes}, valid_session
        assigns(:map).should be_a(Map)
        assigns(:map).should be_persisted
      end

      it "redirects to the created map" do
        post :create, {:map => valid_attributes}, valid_session
        response.should redirect_to(Map.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved map as @map" do
        # Trigger the behavior that occurs when invalid params are submitted
        Map.any_instance.stub(:save).and_return(false)
        post :create, {:map => { "user_id" => "invalid value" }}, valid_session
        assigns(:map).should be_a_new(Map)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Map.any_instance.stub(:save).and_return(false)
        post :create, {:map => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested map" do
        map = Map.create! valid_attributes
        # Assuming there are no other maps in the database, this
        # specifies that the Map created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Map.any_instance.should_receive(:update).with({ "user_id" => "1" })
        put :update, {:id => map.to_param, :map => { "user_id" => "1" }}, valid_session
      end

      it "assigns the requested map as @map" do
        map = Map.create! valid_attributes
        put :update, {:id => map.to_param, :map => valid_attributes}, valid_session
        assigns(:map).should eq(map)
      end

      it "redirects to the map" do
        map = Map.create! valid_attributes
        put :update, {:id => map.to_param, :map => valid_attributes}, valid_session
        response.should redirect_to(map)
      end
    end

    describe "with invalid params" do
      it "assigns the map as @map" do
        map = Map.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Map.any_instance.stub(:save).and_return(false)
        put :update, {:id => map.to_param, :map => { "user_id" => "invalid value" }}, valid_session
        assigns(:map).should eq(map)
      end

      it "re-renders the 'edit' template" do
        map = Map.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Map.any_instance.stub(:save).and_return(false)
        put :update, {:id => map.to_param, :map => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
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
