require 'rails_helper'

RSpec.describe GlucoseReading do
  it 'persists a glucose reading' do
    glucose_reading = GlucoseReading.new({ bg_value: 2, time_stamp: "11:00"})
    glucose_reading.save!

    expect(glucose_reading).to be_persisted
  end

  describe "relationships" do
    it "belongs to a user" do
      user = User.create!(first_name: "John", last_name: "Connor")
      glucose_reading = GlucoseReading.create!(bg_value: 139, time_stamp: "15:00", user: user)

      expect(glucose_reading.user).to eq(user)
    end

    it "requires a user" do
      expect do
        GlucoseReading.create!(bg_value: 139, time_stamp: "15:00")
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  context "bg_value" do
    it 'may be set as a string' do
      glucose_reading = GlucoseReading.create!({ bg_value: "2", time_stamp: "11:00"})

      expect(glucose_reading.bg_value).to eq(2)
    end

    it "does not truncate a decimal" do
      glucose_reading = GlucoseReading.create!({ bg_value: "9.78", time_stamp: "11:00"})

      expect(glucose_reading.bg_value).to eq(9.78)
    end
  end
end
