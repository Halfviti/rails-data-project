class CreateAppearances < ActiveRecord::Migration[5.2]
  def change
    create_table :appearances do |t|
      t.references :character, foreign_key: true
      t.references :film, foreign_key: true

      t.timestamps
    end
  end
end
