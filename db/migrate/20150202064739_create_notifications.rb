class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :sendable, polymorphic: true, index: true
      t.references :receivable, polymorphic: true, index: true
      t.string :action
      t.references :causable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
