class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.references :viewable, polymorphic: true, index: true
      t.references :view_publishable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
