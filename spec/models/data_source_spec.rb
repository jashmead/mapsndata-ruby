require 'spec_helper'

describe DataSource do

  # better to build up fresh user than to rely on the standard users (anonymous, mapinvite, ...)

  let(:user) { FactoryGirl.create(:user) }
  before { 
    # create not build because we need the map.id for the data_source.map_id field
    @map = user.maps.create(name: "Lorem ipsum", description: "Let's map!", map_type: "leaflet")
    @data_source = @map.data_sources.build(name: "Pick a point", description: "How about here?", ds_type: "point", map_id: @map.id)
  }

  subject { @data_source }

  it { should respond_to(:map) }

  it { should respond_to(:map_id) }
  it { should respond_to(:ds_type) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }

  it { should respond_to(:ds_width) }
  it { should respond_to(:ds_height) }
  it { should respond_to(:ds_x) }
  it { should respond_to(:ds_y) }

  it { should be_valid }

  describe "with a name that's too short" do
    before { @data_source.name = "" }
    it { should be_invalid }
  end

  describe "with a name that's too long" do
    ## the string has to come before the '256', so that we coerce towards string
    before { @data_source.name = "a" * 256  }
    it { should be_invalid }
  end

  describe "when map_id is not present" do
    before { @data_source.map_id = nil }
    it { should_not be_valid }
  end

end
