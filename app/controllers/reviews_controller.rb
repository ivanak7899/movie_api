class ReviewsController < ApplicationController
  before_action :set_review, only: [ :show, :update, :destroy ]

  # GET /reviews
  def index
    reviews = Review.all

    render json: ReviewSerializer.render(reviews, root: :reviews), status: :ok
  end

  # GET /reviews/:id
  def show
    render json: ReviewSerializer.render(@review, root: :review), status: :ok
  end

  # POST /reviews
  def create
    review = current_user.reviews.new(review_params)

    if review.save
      render json: ReviewSerializer.render(review, root: :review), status: :created
    else
      render json: { errors: review.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/:id
  def update
    if @review.update(review_params)
      render json: ReviewSerializer.render(@review, root: :review), status: :ok
    else
      render json: { errors: @review.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/:id
  def destroy
    @review.destroy!
    head :no_content
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  # user_id is set from current_user, so it should not be permitted from params
  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :movie_id)
  end
end
