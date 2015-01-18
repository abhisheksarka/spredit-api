class AddTotalPropagationToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :total_propagation, :float, default: 0
  end

  def self.down
    remove_column :posts, :total_propagation
  end
end
