require 'spec_helper'

describe "helps/show" do
  before(:each) do
    @help = assign(:help, stub_model(Help,
      :name => "Name",
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
