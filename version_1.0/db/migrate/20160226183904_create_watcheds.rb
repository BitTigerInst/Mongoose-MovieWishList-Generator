class CreateWatcheds < ActiveRecord::Migration
  def change
    create_table :watcheds do |t|
      t.references :user, index: true
      t.text :list

      t.timestamps
    end
  end
end
