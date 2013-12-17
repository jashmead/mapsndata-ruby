require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :email => "MyString",
      :description => "MyText",
      :url => "MyString",
      :address => "MyString",
      :longitude => "9.99",
      :latitude => "9.99"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "textarea#user_description[name=?]", "user[description]"
      assert_select "input#user_url[name=?]", "user[url]"
      assert_select "input#user_address[name=?]", "user[address]"
      assert_select "input#user_longitude[name=?]", "user[longitude]"
      assert_select "input#user_latitude[name=?]", "user[latitude]"
    end
  end
end
