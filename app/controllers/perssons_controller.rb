class PerssonsController < ApplicationController
  before_action :set_persson, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @perssons = Persson.all
  end

  def show
  end

  def new
    @persson = Persson.new
  end

  def edit
  end

  def create
    @persson = Persson.new(persson_params)

   
    Rails.logger.debug "Organization ID: #{@persson.organization_id}"  # Додає лог для перевірки значення
  


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

  def destroy
    @persson.destroy!

    respond_to do |format|
      format.html { redirect_to perssons_url, notice: "Persson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_persson
      @persson = Persson.find(params[:id])
    end
    
    def persson_params
      params.require(:persson).permit(:first_name, :last_name, :father_name, :name_for_contract, :phone, :email, :send_adress, :role, :birth_data, :note_data, :other_data, :user_id, :organization_id)
    end
end
