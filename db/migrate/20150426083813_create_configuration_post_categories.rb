class CreateConfigurationPostCategories < ActiveRecord::Migration
  def change
    create_table :configuration_post_categories do |t|
      t.string :values
      t.references :configurable_post_category, polymorphic: true

      t.timestamps
    end
    add_index :configuration_post_categories, [:configurable_post_category_id, :configurable_post_category_type], name: :index_configuration_post_categories_id_and_type
  end
end
