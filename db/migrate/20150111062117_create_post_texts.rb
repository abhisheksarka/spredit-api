class CreatePostTexts < ActiveRecord::Migration
  def change
    create_table :post_texts do |t|
      t.text :content

      t.timestamps
    end
  end
end
