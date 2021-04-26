class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.text :name
      t.text :album_id
      t.text :artist_id
      t.timestamps
    end
  end
end
