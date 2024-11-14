class SaleOrganizationsController < ApplicationController
  before_action :set_sale_organization, only: %i[ show edit update destroy ]

  # GET /sale_organizations or /sale_organizations.json
  def index
    @sale_organizations = SaleOrganization.all
  end

  # GET /sale_organizations/1 or /sale_organizations/1.json
  def show
  end

  # GET /sale_organizations/new
  def new
    @sale_organization = SaleOrganization.new
  end

  # GET /sale_organizations/1/edit
  def edit
  end

  # POST /sale_organizations or /sale_organizations.json
  def create
    @sale_organization = SaleOrganization.new(sale_organization_params)

    respond_to do |format|
      if @sale_organization.save
        format.html { redirect_to sale_organization_url(@sale_organization), notice: "Sale organization was successfully created." }
        format.json { render :show, status: :created, location: @sale_organization }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale_organizations/1 or /sale_organizations/1.json
  def update
    respond_to do |format|
      if @sale_organization.update(sale_organization_params)
        format.html { redirect_to sale_organization_url(@sale_organization), notice: "Sale organization was successfully updated." }
        format.json { render :show, status: :ok, location: @sale_organization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_organizations/1 or /sale_organizations/1.json
  def destroy
    @sale_organization.destroy!

    respond_to do |format|
      format.html { redirect_to sale_organizations_url, notice: "Sale organization was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_organization
      @sale_organization = SaleOrganization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_organization_params
      params.require(:sale_organization).permit(:name, :short_name, :ederpou, :ipn, :type_rent, :factic_address, :legal_address, :send_adress, :number_count_bank, :mfo, :name_and_requisites_bank, :phone, :mail)
    end
end
