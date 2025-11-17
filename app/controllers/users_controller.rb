class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    users = User.all

    render json: UserSerializer.render(users, root: :users), status: :ok
  end

  # GET /users/:id
  def show
    render json: UserSerializer.render(@user, root: :user), status: :ok
  end

  # POST /users
  def create
    user = User.new(user_params)

    if user.save
      render json: UserSerializer.render(user, root: :user), status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      render json: UserSerializer.render(@user, root: :user), status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy!
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :role)
  end
end
