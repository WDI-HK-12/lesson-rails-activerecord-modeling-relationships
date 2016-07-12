class AddManagerIdToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :manager_id, :integer
  end
end
