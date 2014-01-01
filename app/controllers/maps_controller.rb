=begin
  actions required
    blank, leaflet, d3, data
  controls required
    -- leaflet controllers (zoom, drag, click)
    -- need a click to go to the url, if that is provided
    -- map/data (other formats as indicated)
    -- will need some local storage to track state
    -- will some data to test:  name, url, address at a minimum, preferably email as well
    -- start with a simple dataset & leaflet controls
=end
class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy, :blank]

  # GET /maps
  # GET /maps.json
  # index is to include a small search feature, just names & descriptions
  def index
    @maps = Map.all
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
    # actually the name should already be titleize'd
    @title = @map.name.titleize
    logger.debug("MapsController.show: @title: #{@title.inspect}")
  end

  # GET /maps/new
  def new
    @map = Map.new
  end

  # GET /maps/1/edit
  def edit
    # actually the name should already be titleize'd
    @title = @map.name.titleize
    logger.debug("MapsController.edit: @title: #{@title.inspect}")
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(map_params)

    respond_to do |format|
      if @map.save
        format.html { redirect_to @map, notice: 'Map was successfully created.' }
        format.json { render action: 'show', status: :created, location: @map }
      else
        format.html { render action: 'new' }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to @map, notice: 'Map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    logger.debug("MapsController.destroy: params: #{params.inspect}")
    @map.destroy
    respond_to do |format|
      format.html { redirect_to maps_url }
      format.json { head :no_content }
    end
  end

  def named_map
    # don't use 'map_params' or similar on 'get', as no ':map' param will be defined!
    map_name = params[:name] || 'home'
    @map = Map.where('name = ?', map_name.titleize).first
    if @map
      @title = @map.name.titleize
      logger.debug("MapsController.named_map: @title: #{@title.inspect}")
      if user_signed_in?
        render 'edit' and return
      else
        render 'show' and return
      end
    else
      # perhaps should show a generic map screen instead
      flash.now[:alert] = "No map found"
      render 'index' and return
    end
  end

  # don't use 'map_params' or similar on 'get', as no ':map' param will be defined!, ':map' is used for forms only
  def map_type_q
    if @map
      if user_signed_in?
        @mode = 'edit'
      else
        @mode = 'show'
      end
      @title = @map.name.titleize
      # 'controller' is not available here, but 'action_name' still is
      logger.debug("MapsController.#{action_name}: @title: #{@title.inspect}")
      render action_name and return
    else
      # perhaps should show a generic map screen instead
      flash.now[:alert] = "Map #{params[:name]} not found."
      render 'index' and return
    end
  end

  def blank
    map_type_q
  end

  def leaflet
    map_type_q
  end

  def d3
    map_type_q
  end

  def list
    map_type_q
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:map).permit(:user_id, :map_type, :name, :description, :map_width, :map_height,
        :avatar)
    end
end
