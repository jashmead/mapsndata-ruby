require 'spec_helper'

describe "data_sources/new" do
  before(:each) do
    assign(:data_source, stub_model(DataSource,
      :map_id => 1,
      :name => "MyString",
      :description => "MyText",
      :url => "MyString",
      :email => "MyString",
      :contact_name => "MyString",
      :address => "MyText",
      :longitude => "9.99",
      :latitude => "9.99",
      :x_pos => "9.99",
      :y_pos => "9.99",
      :x_width => "9.99",
      :y_width => "9.99"
    ).as_new_record)
  end

  it "renders new data_source form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", data_sources_path, "post" do
      assert_select "input#data_source_map_id[name=?]", "data_source[map_id]"
      assert_select "input#data_source_name[name=?]", "data_source[name]"
      assert_select "textarea#data_source_description[name=?]", "data_source[description]"
      assert_select "input#data_source_url[name=?]", "data_source[url]"
      assert_select "input#data_source_email[name=?]", "data_source[email]"
      assert_select "input#data_source_contact_name[name=?]", "data_source[contact_name]"
      assert_select "textarea#data_source_address[name=?]", "data_source[address]"
      assert_select "input#data_source_longitude[name=?]", "data_source[longitude]"
      assert_select "input#data_source_latitude[name=?]", "data_source[latitude]"
      assert_select "input#data_source_x_pos[name=?]", "data_source[x_pos]"
      assert_select "input#data_source_y_pos[name=?]", "data_source[y_pos]"
      assert_select "input#data_source_x_width[name=?]", "data_source[x_width]"
      assert_select "input#data_source_y_width[name=?]", "data_source[y_width]"
    end
  end
end
