class FirmsController < ApplicationController
  before_action :set_firm, only: %i[ show edit update destroy ]

  # GET /firms or /firms.json
  def index
    @firms = Firm.all
  end

  # GET /firms/1 or /firms/1.json
  def show
  end

  # GET /firms/new
  def new
    @firm = Firm.new
  end

  # GET /firms/1/edit
  def edit
  end

  # POST /firms or /firms.json
  def create
    @firm = Firm.new(firm_params)

    respond_to do |format|
      if @firm.save
        format.html { redirect_to firm_url(@firm), notice: "Firm was successfully created." }
        format.json { render :show, status: :created, location: @firm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @firm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /firms/1 or /firms/1.json
  def update
    respond_to do |format|
      if @firm.update(firm_params)
        format.html { redirect_to firm_url(@firm), notice: "Firm was successfully updated." }
        format.json { render :show, status: :ok, location: @firm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @firm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firms/1 or /firms/1.json
  def destroy
    @firm.destroy!

    respond_to do |format|
      format.html { redirect_to firms_url, notice: "Firm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_firm
      @firm = Firm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def firm_params
      params.require(:firm).permit(:name, :edrpou, :email, :ipn, :data, :user_id)
    end
end
