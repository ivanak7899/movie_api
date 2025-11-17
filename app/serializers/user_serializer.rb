class UserSerializer < Blueprinter::Base
  identifier :id

  fields :username, :email, :role, :created_at, :updated_at
end
