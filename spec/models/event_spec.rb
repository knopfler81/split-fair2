require 'rails_helper'

describe Event do
  it { should have_many(:participants) }
  it { should validate_presence_of(:participants) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:total_price) }

end
