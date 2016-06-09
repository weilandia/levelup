class CreateUserTracks < ActiveRecord::Migration
  def change
    create_table :user_tracks do |t|
      t.references :user, index: true, foreign_key: true
      t.references :track, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
