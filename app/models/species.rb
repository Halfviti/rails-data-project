class Species < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
