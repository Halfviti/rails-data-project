class Planet < ApplicationRecord
  has_many :residents, :class_name => 'Character', :foreign_key => 'character_id'

  validates :name, presence: true, uniqueness: true
end
