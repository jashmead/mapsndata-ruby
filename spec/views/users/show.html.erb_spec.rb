require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :email => "Email",
      :description => "MyText",
      :url => "Url",
      :address => "Address",
      :longitude => "9.99",
      :latitude => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/MyText/)
    rendered.should match(/Url/)
    rendered.should match(/Address/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end