class SessionSerializer < Blueprinter::Base
  identifier :id

  field :token

  association :user, blueprint: UserSerializer
end
