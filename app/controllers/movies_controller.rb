class MoviesController < ApplicationController
  before_action :set_movie, only: [ :show, :update, :destroy ]

  # GET /movies
  def index
    movies = Movie.all

    render json: MovieSerializer.render(movies, root: :movies), status: :ok
  end

  # GET /movies/:id
  def show
    render json: MovieSerializer.render(@movie, root: :movie), status: :ok
  end

  # POST /movies
  def create
    movie = Movie.new(movie_params)

    if movie.save
      render json: MovieSerializer.render(movie, root: :movie), status: :created
    else
      render json: { errors: movie.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/:id
  def update
    if @movie.update(movie_params)
      render json: MovieSerializer.render(@movie, root: :movie), status: :ok
    else
      render json: { errors: @movie.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /movies/:id
  def destroy
    @movie.destroy!
    head :no_content
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :release_year, :director_id)
  end
end
