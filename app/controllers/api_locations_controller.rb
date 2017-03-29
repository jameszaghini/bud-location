class ApiLocationsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_filter :parse_request

  def create

    session = Session.find_or_create_by(uuid: @json['session']['uuid'])
    session.platform = @json['session']['platform']

    bud = Bud.where(:session_id => session.id, :uuid => @json['bud']['uuid']).first_or_create
    bud.identifier = @json['bud']['identifier']

    location = Location.new
    location.latitude = @json['location']['latitude']
    location.longitude = @json['location']['longitude']
    location.accuracy = @json['location']['accuracy']
    location.bud_id = bud.id

    Session.transaction do
      session.save
      bud.save
      location.save
    end

    render json: session
  end

  def parse_request
    @json = JSON.parse(request.body.read)
  end

end
