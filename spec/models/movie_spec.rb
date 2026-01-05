require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { should belong_to(:director).class_name('Person').optional }
  it { should have_many(:castings).dependent(:destroy) }
  it { should have_many(:actors).through(:castings).source(:person) }
  it { should have_many(:reviews).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_numericality_of(:release_year).is_less_than_or_equal_to(Date.current.year).allow_nil }
end
