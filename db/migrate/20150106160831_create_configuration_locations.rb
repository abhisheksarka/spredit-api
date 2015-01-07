class CreateConfigurationLocations < ActiveRecord::Migration
  def change
    create_table :configuration_locations do |t|
      t.references :configurable_location, polymorphic: true
      t.float :radius

      t.timestamps
    end
  end
end
