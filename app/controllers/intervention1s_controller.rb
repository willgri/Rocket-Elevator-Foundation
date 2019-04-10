class Intervention1sController < ApplicationController
  before_action :set_intervention1, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!   

  # GET /intervention1s
  # GET /intervention1s.json
  def index
    @intervention = Intervention1.new
    @intervention1s = Intervention1.all
    @customers = Customer.all
    # @buildings = Building.all
  end

  # GET /intervention1s/1
  # GET /intervention1s/1.json
  def show
  end

  # GET /intervention1s/new
  def new
    @intervention1 = Intervention1.new
  end

  # GET /intervention1s/1/edit
  def edit
  end

  # POST /intervention1s
  # POST /intervention1s.json
  def create
    @intervention1 = Intervention1.new(intervention1_params)

    respond_to do |format|
      if @intervention1.save
        format.html { redirect_to @intervention1, notice: 'Intervention1 was successfully created.' }
        format.json { render :show, status: :created, location: @intervention1 }
      else
        format.html { render :new }
        format.json { render json: @intervention1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intervention1s/1
  # PATCH/PUT /intervention1s/1.json
  def update
    respond_to do |format|
      if @intervention1.update(intervention1_params)
        format.html { redirect_to @intervention1, notice: 'Intervention1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @intervention1 }
      else
        format.html { render :edit }
        format.json { render json: @intervention1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intervention1s/1
  # DELETE /intervention1s/1.json
  def destroy
    @intervention1.destroy
    respond_to do |format|
      format.html { redirect_to intervention1s_url, notice: 'Intervention1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention1
      @intervention1 = Intervention1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intervention1_params
      params.fetch(:intervention1, {})
    end
end
