require 'spec_helper'

describe Map do

  # better to build up fresh user than to rely on the standard users (anonymous, mapinvite, ...)
  let(:user) { FactoryGirl.create(:user) }
  before { @map = user.maps.build(name: "Lorem ipsum", description: "Let's map!", map_type: "blank") }

  subject { @map }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }

  its(:user) { should eq user }

  it { should be_valid }

  describe "with a name that's too short" do
    before { @map.name = "" }
    it { should be_invalid }
  end

  describe "with a name that's too long" do
    ## the string has to come before the '256', so that we coerce towards string
    before { @map.name = "a" * 256  }
    it { should be_invalid }
  end

  describe "when user_id is not present" do
    before { @map.user_id = nil }
    it { should_not be_valid }
  end

end
