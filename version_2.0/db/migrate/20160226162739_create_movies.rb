class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :movie_id
      t.string :pic

      t.timestamps
    end
  end
end
