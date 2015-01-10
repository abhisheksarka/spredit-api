class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :postable, polymorphic: true, index: true
      t.references :post_publishable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
