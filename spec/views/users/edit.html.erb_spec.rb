require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :email => "MyString",
      :description => "MyText",
      :url => "MyString",
      :address => "MyString",
      :longitude => "9.99",
      :latitude => "9.99"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
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
