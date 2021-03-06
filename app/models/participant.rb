class Participant < ApplicationRecord

  validates :first_name, presence: true, length: {minimum: 2}
  validates :salary, presence: true

  belongs_to :event, optional: true
  default_scope { order(salary: :desc) }

  def participant_should_pay
    event.total_price.to_f * (salary.fdiv(event.total_salary).round(2))
    #similar to:
    #event.total_price.to_f * (salary.to_f/event.total_salary.to_f).round(2)
  end

  def percentage
   (salary.to_f / event.total_salary.to_f * 100).round(2)
  end
end


