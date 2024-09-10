class PerssonsController < ApplicationController
  before_action :set_persson, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /perssons or /perssons.json
  def index
    @perssons = Persson.all
  end

  # GET /perssons/1 or /perssons/1.json
  def show
  end

  # GET /perssons/new
  def new
    @persson = Persson.new
  end

  # GET /perssons/1/edit
  def edit
  end

  # POST /perssons or /perssons.json
  def create
    @persson = Persson.new(persson_params)

    respond_to do |format|
      if @persson.save
        format.html { redirect_to persson_url(@persson), notice: "Persson was successfully created." }
        format.json { render :show, status: :created, location: @persson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @persson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perssons/1 or /perssons/1.json
  def update
    respond_to do |format|
      if @persson.update(persson_params)
        format.html { redirect_to persson_url(@persson), notice: "Persson was successfully updated." }
        format.json { render :show, status: :ok, location: @persson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @persson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perssons/1 or /perssons/1.json
  def destroy
    @persson.destroy!

    respond_to do |format|
      format.html { redirect_to perssons_url, notice: "Persson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persson
      @persson = Persson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def persson_params
      params.require(:persson).permit(:first_name, :last_name, :father_nane, :name_for_contract, :phone, :email, :send_adress, :role, :birth_data, :note_data, :other_data, :user_id)
    end
end
