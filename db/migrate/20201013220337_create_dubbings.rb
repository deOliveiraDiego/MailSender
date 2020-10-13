class CreateDubbings < ActiveRecord::Migration[5.2]
  def change
    create_table :dubbings do |t|
      t.integer :studio_id
      t.integer :producer_id
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
