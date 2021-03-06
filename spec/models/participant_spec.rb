require "rails_helper"

describe Participant do
   it { should belong_to(:event) }
   it { should validate_presence_of(:first_name)}
   it { should validate_presence_of(:salary)}

   describe "#participant_should_pay" do
    it "should return john's part" do
      john = create(:participant, first_name: "john", salary: 3000)
      max = create(:participant, first_name: "max", salary: 2000)
      event = create(:event, name: "yolo", total_price: 100, participants: [john, max])

      expect(max.participant_should_pay).to eq(40)
    end
  end

  describe "#percentage" do
    it "should give the percentage that a participant owes" do
      john = create(:participant, first_name: "john", salary: 3000)
      max = create(:participant, first_name: "max", salary: 7000)
      total_salary = 10000
      event = create(:event, name: "yolo", total_price: 100, participants: [john, max])

      expect(john.percentage).to eq(30)

    end
  end
end
