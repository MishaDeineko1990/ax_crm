class TovarsController < ApplicationController
  before_action :set_tovar, only: %i[ show edit update destroy ]

  # GET /tovars or /tovars.json
  def index
    @tovars = Tovar.all
  end

  # GET /tovars/1 or /tovars/1.json
  def show
  end

  # GET /tovars/new
  def new
    @tovar = Tovar.new
  end

  # GET /tovars/1/edit
  def edit
  end

  # POST /tovars or /tovars.json
  def create
    @tovar = Tovar.new(tovar_params)

    respond_to do |format|
      if @tovar.save
        format.html { redirect_to tovar_url(@tovar), notice: "Tovar was successfully created." }
        format.json { render :show, status: :created, location: @tovar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tovar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tovars/1 or /tovars/1.json
  def update
    respond_to do |format|
      if @tovar.update(tovar_params)
        format.html { redirect_to tovar_url(@tovar), notice: "Tovar was successfully updated." }
        format.json { render :show, status: :ok, location: @tovar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tovar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tovars/1 or /tovars/1.json
  def destroy
    @tovar.destroy!

    respond_to do |format|
      format.html { redirect_to tovars_url, notice: "Tovar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tovar
      @tovar = Tovar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tovar_params
      params.require(:tovar).permit(:name, :length, :width, :height, :weight, :price, :description, :image, :custom_data, :other_data, tag_ids: [])
    end
end
