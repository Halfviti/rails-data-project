class Species < ApplicationRecord
  belongs_to :homeworld, :class_name => 'Planet', :foreign_key => 'planet_id', optional: true

  validates :name, presence: true, uniqueness: true
end
