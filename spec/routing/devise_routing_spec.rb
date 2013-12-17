require "spec_helper"

describe "devise controller" do

  describe "routing" do

    it "uses devise_for routes" do

			get("/users/sign_in").should route_to("devise/sessions#new")
			post("/users/sign_in").should route_to("devise/sessions#create")
			get("/users/sign_out").should route_to("devise/sessions#destroy")
			post("/users/password").should route_to("devise/passwords#create")
			get("/users/password/new").should route_to("devise/passwords#new")
			get("/users/password/edit").should route_to("devise/passwords#edit")
			patch("/users/password").should route_to("devise/passwords#update")
			put("/users/password").should route_to("devise/passwords#update")
			get("/users/cancel").should route_to("devise/registrations#cancel")
			post("/users").should route_to("devise/registrations#create")
			get("/users/sign_up").should route_to("devise/registrations#new")
			get("/users/edit").should route_to("devise/registrations#edit")
			patch("/users").should route_to("devise/registrations#update")
			put("/users").should route_to("devise/registrations#update")
			delete("/users").should route_to("devise/registrations#destroy")

    end

    it "uses custom routes" do

      get("/sign_up").should route_to("devise/registrations#new")
      get("/sign_in").should route_to("devise/sessions#new")
      delete("/sign_out").should route_to("devise/sessions#destroy")
      get("/reset_password").should route_to("devise/passwords#new")
      get("/settings").should route_to("devise/registrations#edit")

    end

  end

end
