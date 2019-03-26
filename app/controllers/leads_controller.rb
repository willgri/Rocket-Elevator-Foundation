class LeadsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)

      @lead.date = params[:date]
      @lead.full_name = params[:full_name]
      @lead.business_name = params[:business_name]
      @lead.email = params[:email]
      @lead.phone_number = params[:phone_number]
      @lead.department_in_charge_of_elevators = params[:department_in_charge_of_elevators]
      @lead.project_name = params[:project_name]
      @lead.project_description = params[:project_description]
      @lead.message = params[:message]
      @lead.attached_file = params[:attached_file]
     
    respond_to do |format|
      if @lead.save
        UserNotifier.send_email(@lead).deliver
        format.html { redirect_to @lead, notice: 'Lead was successfully created.' }
        format.json { render :show, status: :created, location: @lead }
      else
        format.html { render :new }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.permit(:lead, :date, :full_name, :business_name, 
        :email, :phone_number, :departement_in_charge_of_elevators, 
        :project_name, :project_description, :message, :attached_file)
    end
end
