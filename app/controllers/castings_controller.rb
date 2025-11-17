class CastingsController < ApplicationController
  before_action :set_casting, only: %i[ show update destroy ]

  # GET /castings
  def index
    @castings = Casting.all

    render json: @castings
  end

  # GET /castings/1
  def show
    render json: @casting
  end

  # POST /castings
  def create
    @casting = Casting.new(casting_params)

    if @casting.save
      render json: @casting, status: :created, location: @casting
    else
      render json: @casting.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /castings/1
  def update
    if @casting.update(casting_params)
      render json: @casting
    else
      render json: @casting.errors, status: :unprocessable_content
    end
  end

  # DELETE /castings/1
  def destroy
    @casting.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_casting
      @casting = Casting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def casting_params
      params.require(:casting).permit(:movie_id, :person_id, :role_name)
    end
end
