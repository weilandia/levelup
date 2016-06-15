class AddDataToUserTracks < ActiveRecord::Migration
  def change
    enable_extension 'hstore'
    add_column :user_tracks, :data, :hstore
    add_index :user_tracks, :data, using: :gin
  end
end
