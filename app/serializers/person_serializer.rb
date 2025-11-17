class PersonSerializer < Blueprinter::Base
  identifier :id

  fields :name
end
