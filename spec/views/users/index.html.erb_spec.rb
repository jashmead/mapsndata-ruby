require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :email => "Email",
        :description => "MyText",
        :url => "Url",
        :address => "Address",
        :longitude => "9.99",
        :latitude => "-8.88"
      ),
      stub_model(User,
        :name => "Name",
        :email => "Email",
        :description => "MyText",
        :url => "Url",
        :address => "Address",
        :longitude => "9.99",
        :latitude => "-8.88"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "-8.88".to_s, :count => 2
  end
end
