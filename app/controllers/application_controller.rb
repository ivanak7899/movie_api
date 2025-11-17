class ApplicationController < ActionController::API
  before_action :authenticate_user!

  attr_reader :current_user, :current_session

  private

  def authenticate_user!
    token = request.headers['Authorization']
    
    @current_session = Session.active.find_by(token: token)
    @current_user    = @current_session&.user

    unless @current_user
      render json: { errors: { token: ['is invalid'] } }, status: :unauthorized
    end
  end
end
