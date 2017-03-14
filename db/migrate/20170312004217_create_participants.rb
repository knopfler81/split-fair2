class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.string  :first_name
      t.integer :salary
      t.timestamps
    end
  end
end
