class AddSpeciesRefToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_reference :characters, :species, foreign_key: true
  end
end
