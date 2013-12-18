require 'spec_helper'

describe "maps/show" do
  before(:each) do
    @map = assign(:map, stub_model(Map,
      :user_id => 1,
      :map_type => "Map Type",
      :name => "Name",
      :description => "My Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Map Type/)
    rendered.should match(/Name/)
    rendered.should match(/My Description/)
  end
end
