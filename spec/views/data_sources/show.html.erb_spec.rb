require 'spec_helper'

describe "data_sources/show" do
  before(:each) do
    @data_source = assign(:data_source, stub_model(DataSource,
      :map_id => 1,
      :name => "Name",
      :description => "MyText",
      :url => "Url",
      :email => "Email",
      :contact_name => "Contact Name",
      :address => "MyText",
      :longitude => "9.99",
      :latitude => "9.99",
      :x_pos => "9.99",
      :y_pos => "9.99",
      :x_width => "9.99",
      :y_width => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Url/)
    rendered.should match(/Email/)
    rendered.should match(/Contact Name/)
    rendered.should match(/MyText/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
