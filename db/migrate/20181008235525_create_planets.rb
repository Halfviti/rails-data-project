class CreatePlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :planets do |t|
      t.string :name
      t.integer :rotation_period
      t.integer :orbital_period
      t.string :climate
      t.string :terrain
      t.integer :population

      t.timestamps
    end
  end
end
