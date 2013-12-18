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
  end
end
