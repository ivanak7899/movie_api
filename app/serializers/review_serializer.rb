class ReviewSerializer < Blueprinter::Base
  identifier :id
  
  fields :rating, :comment, :created_at
  
  association :user,  blueprint: UserSerializer
  association :movie, blueprint: MovieSerializer
end
  