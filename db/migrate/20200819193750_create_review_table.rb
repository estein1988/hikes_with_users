class CreateReviewTable < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :review
      t.references :trail
      t.references :hiker
    end
  end
end
