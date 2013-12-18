require 'spec_helper'

describe "data_sources/show" do
  before(:each) do
    @data_source = assign(:data_source, stub_model(DataSource,
      :map_id => 1,
      :name => "Name",
      :description => "My Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/My Description/)
  end
end
