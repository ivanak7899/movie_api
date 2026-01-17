class CastingSerializer < Blueprinter::Base
  identifier :id

  fields :role_name, :created_at, :updated_at
end
