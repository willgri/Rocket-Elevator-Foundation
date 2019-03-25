class QuotesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)

      if params[:building_type] == "Residential" 
        @quote.quality = params[:quality]
        @quote.elevator_price = params[:elevator_price]
        @quote.installation_price = params[:installation_price]
        @quote.number_elevator = params[:number_elevator]
        @quote.total_price = params[:total_price]
      end

      if params[:building_type] == "Commercial" 
        @quote.quality = params[:quality]
        @quote.number_floor = params[:number_floor2]
        @quote.number_basement = params[:number_basement2]
        @quote.number_parking_space = params[:number_parking_space2]
        @quote.elevator_price = params[:elevator_price]
        @quote.installation_price = params[:installation_price]
        @quote.number_elevator = params[:number_elevator]
        @quote.total_price = params[:total_price]
      end

      if params[:building_type] == "Corporate" 
        @quote.quality = params[:quality]
        @quote.number_floor = params[:number_floor3]
        @quote.number_basement = params[:number_basement3]
        @quote.number_of_distinct_business = params[:number_of_distinct_business3]
        @quote.number_parking_space = params[:number_parking_space3]
        @quote.maximum_occupant_per_floor = params[:maximum_occupant_per_floor3]
        @quote.elevator_price = params[:elevator_price]
        @quote.installation_price = params[:installation_price]
        @quote.number_elevator = params[:number_elevator]
        @quote.total_price = params[:total_price]
      end

      if params[:building_type] == "Hybrid" 
        @quote.quality = params[:quality]
        @quote.number_floor = params[:number_floor4]
        @quote.number_basement = params[:number_basement4]
        @quote.number_of_distinct_business = params[:number_of_distinct_business4]
        @quote.number_parking_space = params[:number_parking_space4]
        @quote.maximum_occupant_per_floor = params[:maximum_occupant_per_floor4]
        @quote.elevator_price = params[:elevator_price]
        @quote.installation_price = params[:installation_price]
        @quote.number_elevator = params[:number_elevator]
        @quote.total_price = params[:total_price]
      end





    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'QUOTE WAS SUCCESSFULLY SENT' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'QUOTE WAS SUCCESSFULLY UPDATED.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'QUOTE WAS SUCCESSFULLY DESTROYED.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.permit(:full_name, :phone_number, :building_type, 
        :number_floor, :number_appartment, :number_basement, 
        :number_of_trade_market, :number_parking_space, 
        :number_of_elevators_cage, :number_of_distinct_business, 
        :maximum_occupant_per_floor, :hour_of_activity, 
        :elevator_price, :installation_price, :number_elevator, 
        :quality, :business_name, :email)
      # params.require(:quote).permit()
    end
end

