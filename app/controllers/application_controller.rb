class ApplicationController < ActionController::API
  include Pundit::Authorization

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  attr_reader :current_user, :current_session

  private

  def authenticate_user!
    token = request.headers["Authorization"]

    @current_session = Session.active.find_by(token: token)
    @current_user    = @current_session&.user

    unless @current_user
      render json: { errors: { token: [ "is invalid" ] } }, status: :unauthorized
    end
  end

  def user_not_authorized
    render json: { error: "Not authorized" }, status: :forbidden
  end

  def render_not_found
    render json: { errors: "Not found" }, status: :not_found
  end
end
