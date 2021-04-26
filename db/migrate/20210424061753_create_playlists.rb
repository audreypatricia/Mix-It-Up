class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.text :name
      t.integer :user_id
      t.text :image
      t.timestamps
    end
  end
end
