class AddCategoryToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :category, :string, default: :standard
  end

  def down
    default_column :posts, :category, :string
  end
end
