require 'spec_helper'

describe "maps/index" do
  before(:each) do
    assign(:maps, [
      stub_model(Map,
        :user_id => 1,
        :map_type => "Map Type",
        :name => "Name",
        :description => "MyText",
        :map_width => "9.99",
        :map_height => "-8.88"
      ),
      stub_model(Map,
        :user_id => 1,
        :map_type => "Map Type",
        :name => "Name",
        :description => "MyText",
        :map_width => "9.99",
        :map_height => "-8.88"
      )
    ])
  end

  it "renders a list of maps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Map Type".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "-8.88".to_s, :count => 2
  end
end
