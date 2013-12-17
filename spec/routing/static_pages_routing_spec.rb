require "spec_helper"

describe StaticPagesController do
  describe "routing" do

    ## add in the search routes
    it "routing to static pages" do

      get("/static_pages/about").should route_to("static_pages#about")
      get("/static_pages/contact").should route_to("static_pages#contact")
      get("/static_pages/help").should route_to("static_pages#help")

      get("/about").should route_to("static_pages#about")
      get("/contact").should route_to("static_pages#contact")
      get("/help").should route_to("static_pages#help")

    end

  end
end
