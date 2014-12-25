class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :title
      t.references :conversable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
