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
    @title = @map.name.titleize
    logger.debug("MapsController.show: @title: #{@title.inspect}")
  end

  # GET /maps/new
  def new
    @map = Map.new
  end

  # GET /maps/1/edit
  def edit
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
    @map = Map.where('name = ?', params[:name]).first
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

  def blank
    # don't use 'map_params' or similar on 'get', as no ':map' param will be defined!
    if @map
      if user_signed_in?
        @mode = 'edit'
      else
        @mode = 'show'
      end
      @title = @map.name.titleize
      logger.debug("MapsController.blank: @title: #{@title.inspect}")
      render 'blank' and return
    else
      # perhaps should show a generic map screen instead
      flash.now[:alert] = "Map #{params[:name]} not found."
      render 'index' and return
    end
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
