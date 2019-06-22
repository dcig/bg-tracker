require 'rails_helper'

RSpec.describe BasalDose do
  it 'persists a basal dose'

  it "fails to persist a bolus dose with an invalid timestamp" do
    user = User.create!(first_name: "John", last_name: "Connor", email: "an@email.com", password: "password")
 
    dose = BasalDose.new(amount: 1, time_stamp: "wrong", user: user)
    dose.save
    expect(dose).to_not be_valid
    expect(dose).to_not be_persisted
  end

  describe "relationships" do
    it "belongs to a user" do
      user = User.create!(first_name: "John", last_name: "Connor", email: "johnconner@gmail.com", password: "password")
      dose = BasalDose.create!(amount: 1, time_stamp: "15:00PM", user: user)

      expect(dose.user).to eq(user)
    end

    it "requires a user" do
      expect do
        BasalDose.create!(amount: 1, time_stamp: "15:00PM")
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end  