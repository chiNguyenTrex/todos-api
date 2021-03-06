class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def create
    user = User.create! user_params
    auth_token = AuthenticateUser.new(user.email, user.password).call
    render json: {message: Message.account_created, auth_token: auth_token}, status: :create
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
