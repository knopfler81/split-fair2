class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string  :name
      t.integer :total_price

      t.timestamps
    end
  end
end
