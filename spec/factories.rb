FactoryGirl.define do
  factory :event do
    name {Faker::Friends.character}
    total_price 50
    participants {create_list(:participant, 3) }
  end

  factory :participant do
    first_name { Faker::Name.first_name }
    salary 900
  end
end
