class PeopleController < ApplicationController
  before_action :set_person, only: [ :show, :update, :destroy ]

  # GET /people
  def index
    @people = Person.all

    render json: PersonSerializer.render(people, root: :people), status: :ok
  end

  # GET /people/:id
  def show
    render json: PersonSerializer.render(@person, root: :person), status: :ok
  end

  # POST /people
  def create
    person = Person.new(person_params)

    if person.save
      render json: PersonSerializer.render(person, root: :person), status: :created
    else
      render json: { errors: person.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/:id
  def update
    if @person.update(person_params)
      render json: PersonSerializer.render(@person, root: :person), status: :ok
    else
      render json: { errors: @person.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /people/:id
  def destroy
    @person.destroy!
    head :no_content
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name)
  end
end
