class PhoneRequestsController < ApplicationController
  before_action :set_phone_request, only: [:show, :edit, :update, :destroy]

  # GET /phone_requests
  # GET /phone_requests.json
  def index
    @phone_requests = PhoneRequest.all
  end

  # GET /phone_requests/1
  # GET /phone_requests/1.json
  def show
  end

  # GET /phone_requests/new
  def new
    @phone_request = PhoneRequest.new
  end

  # GET /phone_requests/1/edit
  def edit
  end

  # POST /phone_requests
  # POST /phone_requests.json
  def create
    @phone_request = PhoneRequest.new(phone_request_params)
    
    permettoDiParcheggiare = 0
    permettoDiRitirareLaBici = 0
    
    if @phone_request.user.isActive?
     permettoDiParcheggiare +=1
     permettoDiRitirareLaBici +=1
    else
     permettoDiRitirareLaBici +=1
    end
    
    if @phone_request.chain.isFree?
     permettoDiParcheggiare +=1
    else
     permettoDiRitirareLaBici +=1
    end
    
    if @phone_request.user.hasBikeParkedin? @phone_request.chain
     permettoDiRitirareLaBici+=1
    else
     permettoDiParcheggiare +=1
    end
     
    if permettoDiRitirareLaBici ==3
      parcheggio = @phone_request.chain.parking_events-last
      parcheggio.getbikerequest = Time.now
      parcheggio.save
    end
     
      
    if permettoDiParcheggiare ==3
      parcheggio = ParkingEvent.new( :user => @phone_request.user, :chain => @phone_request.chain, :parkrequest => Time.now)
      parcheggio.save
      
      
      comando = Command.new(:chain => @phone_request.chain)
      comando.azione = "open"
      comando.save
    end
    
    
      
    end
end