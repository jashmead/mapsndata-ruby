require 'spec_helper'

describe "data_sources/index" do
  before(:each) do
    assign(:data_sources, [
      stub_model(DataSource,
        :map_id => 1,
        :name => "Name",
        :description => "MyText",
        :url => "Url",
        :email => "Email",
        :contact_name => "Contact Name",
        :address => "MyAddress",
        :longitude => "1.11",
        :latitude => "2.22",
        :x_pos => "3.33",
        :y_pos => "4.44",
        :x_width => "5.55",
        :y_width => "6.66"
      ),
      stub_model(DataSource,
        :map_id => 1,
        :name => "Name",
        :description => "MyText",
        :url => "Url",
        :email => "Email",
        :contact_name => "Contact Name",
        :address => "MyAddress",
        :longitude => "1.11",
        :latitude => "2.22",
        :x_pos => "3.33",
        :y_pos => "4.44",
        :x_width => "5.55",
        :y_width => "6.66"
      )
    ])
  end

  it "renders a list of data_sources" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyAddress".to_s, :count => 2
    assert_select "tr>td", :text => "1.11".to_s, :count => 2
    assert_select "tr>td", :text => "2.22".to_s, :count => 2
    assert_select "tr>td", :text => "3.33".to_s, :count => 2
    assert_select "tr>td", :text => "4.44".to_s, :count => 2
    assert_select "tr>td", :text => "5.55".to_s, :count => 2
    assert_select "tr>td", :text => "6.66".to_s, :count => 2
  end
end
