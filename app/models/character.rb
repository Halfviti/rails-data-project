class Character < ApplicationRecord
  belongs_to :homeworld, :class_name => 'Planet', :foreign_key => 'planet_id'
  has_many :films, through :appearances

  validates :name, presence: true
end
