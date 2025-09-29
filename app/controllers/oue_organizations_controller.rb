class OueOrganizationsController < ApplicationController
  before_action :set_oue_organization, only: %i[ show edit update destroy add_user remove_user ]
  before_action :authenticate_user!

  # GET /oue_organizations or /oue_organizations.json
  def index
    @oue_organizations = OueOrganization.all
  end

  # GET /oue_organizations/1 or /oue_organizations/1.json
  def show
    @users = @oue_organization.users
    @available_users = User.where.not(id: @oue_organization.user_ids)
  end

  # GET /oue_organizations/new
  def new
    @oue_organization = OueOrganization.new
  end

  # GET /oue_organizations/1/edit
  def edit
  end

  # POST /oue_organizations or /oue_organizations.json
  def create
    @oue_organization = OueOrganization.new(oue_organization_params)

    respond_to do |format|
      if @oue_organization.save
        format.html { redirect_to oue_organization_url(@oue_organization), notice: "Oue organization was successfully created." }
        format.json { render :show, status: :created, location: @oue_organization }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oue_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oue_organizations/1 or /oue_organizations/1.json
  def update
    respond_to do |format|
      if @oue_organization.update(oue_organization_params)
        format.html { redirect_to oue_organization_url(@oue_organization), notice: "Oue organization was successfully updated." }
        format.json { render :show, status: :ok, location: @oue_organization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @oue_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oue_organizations/1 or /oue_organizations/1.json
  def destroy
    @oue_organization.destroy!

    respond_to do |format|
      format.html { redirect_to oue_organizations_url, notice: "Oue organization was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST /oue_organizations/1/add_user
  def add_user
    user = User.find(params[:user_id])
    @oue_organization.users << user unless @oue_organization.users.include?(user)
    
    respond_to do |format|
      format.html { redirect_to @oue_organization, notice: "Користувача успішно додано до організації." }
      format.json { render :show, status: :ok, location: @oue_organization }
    end
  end

  # DELETE /oue_organizations/1/remove_user/1
  def remove_user
    user = User.find(params[:user_id])
    @oue_organization.users.delete(user)
    
    respond_to do |format|
      format.html { redirect_to @oue_organization, notice: "Користувача успішно видалено з організації." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oue_organization
      @oue_organization = OueOrganization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oue_organization_params
      params.require(:oue_organization).permit(:name, :short_name, :ederpou, :ipn, :type_rent, :factic_address, :legal_address, :send_adress, :number_count_bank, :mfo, :name_and_requisites_bank, :phone, :mail)
    end
end
