module ExceptionHandler
  extend ActiveSupport::Concern

  AuthenticationError = Class.new StandardError
  MissingToken = Class.new StandardError
  InvalidToken = Class.new StandardError

  included do
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :unprocessable_entity
    rescue_from ExceptionHandler::InvalidToken, with: :unprocessable_entity
  end

  private

  def unprocessable_entity e
    render json: {"message": e}, status: :unprocessable_entity
  end

  def unauthorized_request e
    render json: {"message": e}, status: :unauthorized
  end
end
