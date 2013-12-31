require 'spec_helper'

describe "helps/index" do
  before(:each) do
    assign(:helps, [
      stub_model(Help,
        :name => "Name",
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(Help,
        :name => "Name",
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of helps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end