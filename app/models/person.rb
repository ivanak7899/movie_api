class Person < ApplicationRecord
  has_many :castings, dependent: :destroy
  has_many :movies, through: :castings

  has_many :directed_movies,
           class_name: "Movie",
           foreign_key: :director_id

  validates :name, presence: true
end
