require 'rails_helper'

RSpec.describe BolusDose do
  it 'persists a bolus dose' 

  it "fails to persist a bolus dose with an invalid timestamp" do
    user = User.create!(first_name: "John", last_name: "Connor", email: "an@email.com", password: "password")
 
    dose = BolusDose.new(amount: 1, time_stamp: "wrong", user: user)
    dose.save
    expect(dose).to_not be_valid
    expect(dose).to_not be_persisted
  end

  describe "relationships" do
    it "belongs to a user" do
      user = User.create!(first_name: "John", last_name: "Connor")
      dose = BolusDose.create!(amount: 1, time_stamp: "15:00", user: user)

      expect(dose.user).to eq(user)
    end

    it "requires a user" do
      expect do
        BolusDose.create!(amount: 1, time_stamp: "15:00")
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end  