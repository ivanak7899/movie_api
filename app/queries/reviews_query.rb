class ReviewsQuery
  def initialize(relation = Review.all)
    @relation = relation
  end

  def call(params)
    scope = @relation

    if params[:movie_id].present?
      scope = scope.where(movie_id: params[:movie_id])
    end

    if params[:user_id].present?
      scope = scope.where(user_id: params[:user_id])
    end

    if params[:rating_from].present?
      scope = scope.where("rating >= ?", params[:rating_from].to_i)
    end

    if params[:rating_to].present?
      scope = scope.where("rating <= ?", params[:rating_to].to_i)
    end

    scope
  end
end
