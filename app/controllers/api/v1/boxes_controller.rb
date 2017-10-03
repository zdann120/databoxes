class Api::V1::BoxesController < Api::ApiController
  def show
    @box = Box.find params[:id]
    @data = @box.data.map { |d| {identifier: d.identifier, payload: d.payload} }
    render json: @data
  end

  def keys
    @box = Box.find params[:id]
    @data = @box.data.all.pluck(:identifier)
    render json: @data
  end
end
