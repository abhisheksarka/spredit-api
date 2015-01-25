class CreatePostPhotos < ActiveRecord::Migration
  def change
    create_table :post_photos do |t|
      t.string :content
      t.string :photo

      t.timestamps
    end
  end
end
