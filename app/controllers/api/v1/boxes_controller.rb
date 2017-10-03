class Api::V1::BoxesController < ApplicationController
  def show
    @box = Box.find params[:id]
    @data = @box.data.map { |d| {identifier: d.identifier, payload: d.payload} }
    render json: @data
  end
end
