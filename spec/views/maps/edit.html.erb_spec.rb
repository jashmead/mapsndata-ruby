require 'spec_helper'

describe "maps/edit" do
  before(:each) do
    @map = assign(:map, stub_model(Map,
      :user_id => 1,
      :map_type => "MyString",
      :name => "MyString",
      :description => "MyText",
      :map_width => "9.99",
      :map_height => "9.99"
    ))
  end

  it "renders the edit map form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", map_path(@map), "post" do
      assert_select "input#map_user_id[name=?]", "map[user_id]"
      assert_select "input#map_map_type[name=?]", "map[map_type]"
      assert_select "input#map_name[name=?]", "map[name]"
      assert_select "textarea#map_description[name=?]", "map[description]"
      assert_select "input#map_map_width[name=?]", "map[map_width]"
      assert_select "input#map_map_height[name=?]", "map[map_height]"
    end
  end
end
