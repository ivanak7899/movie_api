class MovieSerializer < Blueprinter::Base
  identifier :id

  fields :title, :description, :release_year, :created_at, :updated_at

  association :director, blueprint: PersonSerializer
  association :actors, blueprint: PersonSerializer
end
