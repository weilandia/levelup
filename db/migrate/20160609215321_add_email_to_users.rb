class AddEmailToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :email,              null: false, default: ""
    end

    add_index :users, :email,                unique: true
  end
end
