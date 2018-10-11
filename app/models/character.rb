class Character < ApplicationRecord
  belongs_to :homeworld, :class_name => 'Planet', :foreign_key => 'planet_id', optional: true
  belongs_to :species, optional: true
  has_many :appearances
  has_many :films, through: :appearances

  validates :name, presence: true
end
