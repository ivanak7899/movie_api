class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create ]

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session = user.sessions.create!

      render json: SessionSerializer.render(session, root: :session), status: :created
    else
      render json: { errors: { credentials: [ "are invalid" ] } }, status: :unauthorized
    end
  end

  def destroy
    token   = request.headers["Authorization"]&.to_s
    session = Session.find_by_token!(token)

    authorize session
    session.revoke!

    head :no_content
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
