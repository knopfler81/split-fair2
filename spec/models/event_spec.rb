require 'rails_helper'

describe Event do
  it { should have_many(:participants) }
  it { should validate_presence_of(:participants)}
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:total_price) }

  describe "#total_salary" do
    it "should return the total salary of the participants" do
      partcipant_1 = create(:participant, salary: 2000)
      partcipant_2 = create(:participant, salary: 3000)
      expect(partcipant_1.salary + partcipant_2.salary).to eq(5000)
    end
  end

end
