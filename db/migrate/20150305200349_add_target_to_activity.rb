class AddTargetToActivity < ActiveRecord::Migration
  def self.up
    add_reference :activities, :targetable, polymorphic: true, index: true
  end

  def self.down
    remove_reference :activities, :targetable, polymorphic: true, index: true
  end
end
