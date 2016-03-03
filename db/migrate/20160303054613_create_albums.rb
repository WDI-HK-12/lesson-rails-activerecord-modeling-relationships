class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :year

      t.integer :artist_id, index: true
      t.integer :genre_id, index: true

      t.timestamps null: false
    end
  end
end
