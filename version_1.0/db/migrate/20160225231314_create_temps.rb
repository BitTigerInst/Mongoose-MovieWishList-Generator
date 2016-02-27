class CreateTemps < ActiveRecord::Migration
  def change
    create_table :temps do |t|
      t.string :title
      t.integer :movie_id
      t.string :pic
      t.text :genre_ids
      t.references :user, index: true

      t.timestamps
    end
  end
end
