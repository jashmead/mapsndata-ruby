require "spec_helper"

# http://stackoverflow.com/questions/8901726/testing-routing-redirects-using-rspec
describe "redirection" do
  it "should redirect sitemap to maps/sitemap" do
    get "/sitemap"
    response.should redirect_to("/maps/sitemap")
  end
  it "should redirect help to maps/help" do
    get "/help"
    response.should redirect_to("/maps/help")
  end
  it "should redirect home to maps/home " do
    get "/home"
    response.should redirect_to("/maps/home")
  end
end
