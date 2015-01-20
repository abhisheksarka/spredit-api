class AddCommentPublishableToComments < ActiveRecord::Migration
  def up
    change_table :comments do |t|
      t.references :comment_publishable, :polymorphic => true
    end
  end

  def down
    change_table :comments do |t|
      t.remove_references :comment_publishable, :polymorphic => true
    end
  end
end
