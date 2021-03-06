class Film < ApplicationRecord
  has_many :appearances
  has_many :characters, through: :appearances

  validates :title, presence: true, uniqueness: true
end
