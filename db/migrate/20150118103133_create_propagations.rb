class CreatePropagations < ActiveRecord::Migration
  def change
    create_table :propagations do |t|
      t.references :propagatable, polymorphic: true, index: true
      t.float :total

      t.timestamps
    end
  end
end
