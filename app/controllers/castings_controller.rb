class CastingsController < ApplicationController
  before_action :set_casting, only: [ :show, :update, :destroy ]

  # GET /castings
  def index
    castings = Casting.all

    render json: CastingSerializer.render(castings, root: :castings), status: :ok
  end

  # GET /castings/:id
  def show
    render json: CastingSerializer.render(@casting, root: :casting), status: :ok
  end

  # POST /castings
  def create
    casting = Casting.new(casting_params)
    authorize casting

    if casting.save
      render json: CastingSerializer.render(casting, root: :casting), status: :created
    else
      render json: { errors: casting.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /castings/:id
  def update
    authorize @casting

    if @casting.update(casting_params)
      render json: CastingSerializer.render(@casting, root: :casting), status: :ok
    else
      render json: { errors: @casting.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /castings/:id
  def destroy
    authorize @casting

    @casting.destroy!
    head :no_content
  end

  private

  def set_casting
    @casting = Casting.find(params[:id])
  end

  def casting_params
    params.require(:casting).permit(:movie_id, :person_id, :role_name)
  end
end
