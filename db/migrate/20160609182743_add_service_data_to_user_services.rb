class AddServiceDataToUserServices < ActiveRecord::Migration
  def change
    enable_extension 'hstore'
    add_column :user_services, :service_data, :hstore
    add_index :user_services, :service_data, using: :gin
  end
end
