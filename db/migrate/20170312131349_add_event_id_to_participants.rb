class AddEventIdToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_reference :participants, :event, index: true
  end
end
