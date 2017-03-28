class ApiLocationsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_filter :parse_request

  def create

    session = Session.find_or_create_by(uuid: @json['session']['uuid'])
    session.platform = @json['session']['platform']

    bud = Bud.where(:uuid => @json['bud']['uuid'], :session_id => session.id).first_or_create

    # bud = Bud.find_or_create_by(uuid: @json['bud']['uuid'])
    bud.identifier = @json['bud']['identifier']
    # bud.session_id = session.id
    bud.save

    location = Location.new
    location.latitude = @json['location']['latitude']
    location.longitude = @json['location']['longitude']
    location.bud_id = bud.id
    location.save

    session.save

    render json: session
  end

  def parse_request
    @json = JSON.parse(request.body.read)
  end

end
