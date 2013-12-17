require 'spec_helper'

describe "maps/new" do
  before(:each) do
    assign(:map, stub_model(Map,
      :user_id => 1,
      :map_type => "MyString",
      :name => "MyString",
      :description => "MyText",
      :map_width => "9.99",
      :map_height => "9.99"
    ).as_new_record)
  end

  it "renders new map form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", maps_path, "post" do
      assert_select "input#map_user_id[name=?]", "map[user_id]"
      assert_select "input#map_map_type[name=?]", "map[map_type]"
      assert_select "input#map_name[name=?]", "map[name]"
      assert_select "textarea#map_description[name=?]", "map[description]"
      assert_select "input#map_map_width[name=?]", "map[map_width]"
      assert_select "input#map_map_height[name=?]", "map[map_height]"
    end
  end
end
