class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :set_user_organizations, only: [:edit]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role])
  end

  private

  def set_user_organizations
    if current_user
      @user_organizations = current_user.oue_organizations
      @available_organizations = OueOrganization.where.not(id: current_user.oue_organization_ids)
    end
  end
end