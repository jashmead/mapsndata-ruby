require 'spec_helper'

describe "maps/show" do
  before(:each) do
    @map = assign(:map, stub_model(Map,
      :user_id => 1,
      :map_type => "Map Type",
      :name => "Name",
      :description => "MyText",
      :map_width => "9.99",
      :map_height => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Map Type/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
