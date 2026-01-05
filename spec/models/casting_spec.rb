require 'rails_helper'

RSpec.describe Casting, type: :model do
  it { should belong_to(:movie) }
  it { should belong_to(:person) }
end
