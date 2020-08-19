class CreateTrailTable < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :location
      t.integer :difficulty
      t.integer :length
      t.integer :elevation
      t.string :route
    end
  end
end
