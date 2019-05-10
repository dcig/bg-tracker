require 'rails_helper'

RSpec.describe BasalDose do
  it 'persists a basal dose'

  describe "relationships" do
    it "belongs to a user" do
      user = User.create!(first_name: "John", last_name: "Connor")
      dose = BasalDose.create!(amount: 1, time_stamp: "15:00", user: user)

      expect(dose.user).to eq(user)
    end

    it "requires a user" do
      expect do
        BasalDose.create!(amount: 1, time_stamp: "15:00")
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end  