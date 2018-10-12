class Planet < ApplicationRecord
  has_many :residents, :class_name => 'Character'

  validates :name, presence: true, uniqueness: true
end
