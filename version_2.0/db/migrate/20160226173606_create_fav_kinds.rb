class CreateFavKinds < ActiveRecord::Migration
  def change
    create_table :fav_kinds do |t|
      t.references :user, index: true
      t.integer :genre_id

      t.timestamps
    end
  end
end
