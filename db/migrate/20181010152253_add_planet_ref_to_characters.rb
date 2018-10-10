class AddPlanetRefToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_reference :characters, :planet, foreign_key: true
  end
end
