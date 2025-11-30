class MoviesQuery
  def initialize(relation = Movie.all)
    @relation = relation
  end

  def call(params)
    scope = @relation

    if params[:title].present?
      scope = scope.where("title LIKE ?", "%#{params[:title]}%")
    end

    if params[:year_from].present?
      scope = scope.where("release_year >= ?", params[:year_from].to_i)
    end

    if params[:year_to].present?
      scope = scope.where("release_year <= ?", params[:year_to].to_i)
    end

    if params[:director_id].present?
      scope = scope.where(director_id: params[:director_id])
    end

    if params[:actor_id].present?
      scope = scope.joins(:castings).where(castings: { person_id: params[:actor_id] }).distinct
    end

    if params[:min_rating].present?
      scope = scope
        .joins(:reviews)
        .group("movies.id")
        .having("AVG(reviews.rating) >= ?", params[:min_rating].to_f)
    end

    scope
  end
end
