class MovieSerializer < Blueprinter::Base
  identifier :id

  fields :title, :description, :release_year

  association :director, blueprint: PersonSerializer
  association :actors, blueprint: PersonSerializer
end
