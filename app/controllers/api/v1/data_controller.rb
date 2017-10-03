class Api::V1::DataController < Api::ApiController # ~> NameError: uninitialized constant Api
  before_action :authenticate_user!, only: [:payload]
  def index
    set_box
    @data = @box.data.map{|d| [d.identifier, d.payload]}
    render json: { payload: @data }
  end
  def show
    set_box
    set_datum
    if @datum
      render json: {payload: @datum.payload, status: 'ok'}, status: '200'
    else
      render json: {status: 'not found'}, status: '404'
    end
  end

  def create
    check_if_json_format
    set_box
    data = JSON.parse(request.body.read)
    new_data = @box.data.new(identifier: data['identifier'],
                    payload: data['payload'])
    if @box.save!
      render json: {msg: 'saved'}, status: 200
    else
      render json: {msg: 'error'}.merge(new_data.errors), status: 406
    end # => 
  end

  def destroy
    set_box
    set_datum
    if @datum.try(:destroy)
      render json: { msg: 'deleted' }, status: 200
    else
      render json: {msg: 'no such key'}, status: 406
    end
  end

  def payload
    set_box
    set_datum
    render json: @datum.payload
    authorize @datum
  end

  private

  def set_datum
    @datum = Datum.where(box: @box, identifier: params[:id]).first
  end

  def set_box
    @box = Box.find(params[:box_id])
  end

  def check_if_json_format
    return if request.format == 'application/json'
    #render nothing: true, status: 406
  end
end

# ~> NameError
# ~> uninitialized constant Api
# ~>
# ~> /var/folders/k3/q4dpz6p977q18bhrhq97gv6r0000gn/T/seeing_is_believing_temp_dir20171002-93235-1xx53ey/program.rb:1:in `<main>'
