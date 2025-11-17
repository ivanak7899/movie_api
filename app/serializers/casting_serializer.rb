class CastingSerializer < Blueprinter::Base
  identifier :id
  
  fields :role_name
  
  association :movie, blueprint: MovieSerializer
  association :person, blueprint: PersonSerializer
end
  