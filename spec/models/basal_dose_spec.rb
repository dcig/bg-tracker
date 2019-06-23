require 'rails_helper'

RSpec.describe BasalDose do
  let(:user) { create(:user) }

  it 'persists a basal dose' do
    dose = BasalDose.new(amount: 1, time_stamp: "1:00PM", user: user)
    dose.save
  end

  it "fails to persist a bolus dose with an invalid timestamp" do
    user = create(:user)
 
    dose = BasalDose.new(amount: 1, time_stamp: "wrong", user: user)
    dose.save
    expect(dose).to_not be_valid
    expect(dose).to_not be_persisted
  end

  describe "relationships" do
    it "belongs to a user" do
      user = create(:user)
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