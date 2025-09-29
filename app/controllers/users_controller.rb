class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :add_organization, :remove_organization, :create_and_add_organization]

  def show
    @oue_organizations = @user.oue_organizations
  end

  # POST /users/1/add_organization
  def add_organization
    organization = OueOrganization.find(params[:organization_id])
    
    # Перевіряємо, чи користувач має право додавати організації
    unless can_manage_user_organizations?
      redirect_to @user, alert: 'У вас немає прав для виконання цієї дії'
      return
    end
    
    if @user.oue_organizations.include?(organization)
      redirect_to edit_user_registration_path, alert: 'Організація вже додана до вашого профілю'
    else
      @user.oue_organizations << organization
      redirect_to edit_user_registration_path, notice: 'Організацію успішно додано'
    end
  end

  # DELETE /users/1/remove_organization/1
  def remove_organization
    organization = OueOrganization.find(params[:organization_id])
    
    # Перевіряємо, чи користувач має право видаляти організації
    unless can_manage_user_organizations?
      redirect_to @user, alert: 'У вас немає прав для виконання цієї дії'
      return
    end
    
    @user.oue_organizations.delete(organization)
    redirect_to edit_user_registration_path, notice: 'Організацію успішно видалено'
  end

  # POST /users/1/create_and_add_organization
  def create_and_add_organization
    # Перевіряємо, чи користувач має право створювати організації
    unless can_manage_user_organizations?
      redirect_to @user, alert: 'У вас немає прав для виконання цієї дії'
      return
    end
    
    organization = OueOrganization.new(organization_params)
    
    if organization.save
      @user.oue_organizations << organization
      redirect_to edit_user_registration_path, notice: 'Організацію успішно створено та додано до вашого профілю'
    else
      redirect_to edit_user_registration_path, alert: "Помилка при створенні організації: #{organization.errors.full_messages.join(', ')}"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def can_manage_user_organizations?
    current_user == @user || current_user.admin?
  end

  def organization_params
    params.require(:oue_organization).permit(:name, :short_name, :ederpou, :ipn, :type_rent, :factic_address, :legal_address, :send_adress, :number_count_bank, :mfo, :name_and_requisites_bank, :phone, :mail)
  end
end