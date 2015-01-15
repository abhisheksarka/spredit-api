class CreateSpreads < ActiveRecord::Migration
  def change
    create_table :spreads do |t|
      t.references :spreadable, polymorphic: true
      t.references :spread_publishable, polymorphic: true
      t.string :action

      t.timestamps
    end
     add_index :spreads, [:spreadable_id, :spreadable_type], name: :index_spreads_on_spreadable_id_and_type
     add_index :spreads, [:spread_publishable_id, :spread_publishable_type], name: :index_spreads_on_spread_publishable_id_and_type
  end
end

