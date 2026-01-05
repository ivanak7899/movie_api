require 'rails_helper'

RSpec.describe Person, type: :model do
  it { should have_many(:castings).dependent(:destroy) }
  it { should have_many(:movies).through(:castings) }
  it { should have_many(:directed_movies).class_name('Movie').with_foreign_key('director_id') }
  it { should validate_presence_of(:name) }
end
