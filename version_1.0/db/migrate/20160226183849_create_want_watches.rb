class CreateWantWatches < ActiveRecord::Migration
  def change
    create_table :want_watches do |t|
      t.references :user, index: true
      t.text :list

      t.timestamps
    end
  end
end
