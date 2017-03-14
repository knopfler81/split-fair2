class Event < ApplicationRecord
  has_many :participants, inverse_of: :event
  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true

  def total_salary
    all_salary = []
    participants.each do |participant|
      all_salary << participant.salary
    end
    return @total_salary = all_salary.inject(0,:+)
  end
end

