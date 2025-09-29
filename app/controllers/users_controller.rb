class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def show
    @oue_organizations = @user.oue_organizations
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end