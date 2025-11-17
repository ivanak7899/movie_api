class Movie < ApplicationRecord
  belongs_to :director, class_name: "Person", foreign_key: :director_id, optional: true

  has_many :castings, dependent: :destroy
  has_many :actors, through: :castings, source: :person
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :release_year, numericality: { allow_nil: true, less_than_or_equal_to: Date.current.year }
end
