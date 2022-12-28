class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    @property.nearest_stations.build
  end

  def create
   @property = Property.new(property_params)
   if @property.save
    redirect_to properties_path, notice: "作成しました"
   else
    @property.nearest_stations.build
    render :new
   end
  end

  def show
   @nearest_stations = @property.nearest_stations
  end

  def edit
    @property.nearest_stations.build
  end

  def update
    if @property.update(property_params)
        redirect_to properties_path, notice: "編集しました"
    else
        render :edit
  end
end

def destroy
    @property.destroy
    redirect_to properties_path, notice: "削除しました" 
end
  
  private

  def property_params
    params.require(:property).permit(:property_name, :rent, :address, :age, :note, nearest_stations_attributes: {})
  end

  def set_property
    @property = Property.find(params[:id])
  end

end

