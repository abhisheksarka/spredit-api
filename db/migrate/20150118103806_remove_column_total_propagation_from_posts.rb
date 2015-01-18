class RemoveColumnTotalPropagationFromPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :total_propagation
  end
  def self.down
    add_column :posts, :total_propagation, :float, default: 0
  end
end
