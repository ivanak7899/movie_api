class PeopleQuery
  def initialize(relation = Person.all)
    @relation = relation
  end

  def call(params)
    scope = @relation

    if params[:name].present?
      scope = scope.where("name LIKE ?", "%#{params[:name]}%")
    end

    if params[:movie_id].present?
      scope = scope.joins(:castings).where(castings: { movie_id: params[:movie_id] }).distinct
    end

    scope
  end
end
