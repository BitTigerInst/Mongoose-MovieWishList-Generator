class CreateFavLists < ActiveRecord::Migration
  def change
    create_table :fav_lists do |t|
      t.references :user, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end
