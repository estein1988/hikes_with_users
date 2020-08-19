class CreateHikerTable < ActiveRecord::Migration[6.0]
  def change
    create_table :hikers do |t|
      t.string :name
      t.integer :age
      t.string :experience
    end
  end
end
