require 'spec_helper'

describe "data_sources/show" do
  before(:each) do
    @data_source = assign(:data_source, stub_model(DataSource,
      :map_id => 1,
      :label => "Label",
      :details => "My Details"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Label/)
    rendered.should match(/My Details/)
  end
end
