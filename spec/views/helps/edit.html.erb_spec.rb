require 'spec_helper'

describe "helps/edit" do
  before(:each) do
    @help = assign(:help, stub_model(Help,
      :name => "MyString",
      :title => "Help Title",
      :description => "MyText"
    ))
  end

  it "renders the edit help form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    # TBD:  use 'select' even for non-admins?
    assert_select "form[action=?][method=?]", help_path(@help), "post" do
      assert_select "input#help_name[name=?]", "help[name]"
      # assert_select "input#help_title[name=?]", "help[title]"
      assert_select "input#help_title[name=?]", "help[title]"
      assert_select "textarea#help_description[name=?]", "help[description]"
    end
  end
end
