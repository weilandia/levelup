class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid
      t.references :user, index: true, foreign_key: true
      t.string :token
      t.string :secret
      t.string :username

      t.timestamps null: false
    end
  end
end
