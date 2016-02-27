class CreateFavs < ActiveRecord::Migration
  def change
    create_table :favs do |t|
      t.references :user, index: true
      t.references :genre, index: true

      t.timestamps
    end
  end
end
