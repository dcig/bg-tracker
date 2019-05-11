require 'rails_helper'

RSpec.describe User do
  it 'persists a user' do
    user = User.new({ first_name: "Dan", last_name: "Cigler", basal_insulin: "Tresiba", bolus_insulin: "Novolog" })

    user.save!

    expect(user).to be_persisted
  end

  describe "relationships" do
    let(:user) do
      User.create!({
        first_name: "Dan",
        last_name: "Cigler",
        basal_insulin: "Tresiba",
        bolus_insulin: "Novolog"
      })
    end

    context "basal doses" do
      it "can have many" do
        dose1 = BasalDose.create!(amount: 2, time_stamp: "12:00", user: user)
        dose2 = BasalDose.create!(amount: 5, time_stamp: "12:00", user_id: user.id)

        expect(user.basal_doses).to match_array([dose1, dose2])
      end

      it "separates doses by user" do
        dose1 = BasalDose.create!(amount: 2, time_stamp: "12:00", user: user)
        dose2 = BasalDose.create!(amount: 5, time_stamp: "12:00", user_id: user.id)

        other_user = User.create!(first_name: "John", last_name: "Connor")

        other_user_dose1 = BasalDose.create!(amount: 12, time_stamp: "12:00", user: other_user)
        other_user_dose2 = BasalDose.create!(amount: 15, time_stamp: "12:00", user_id: other_user.id)

        expect(user.basal_doses).to match_array([dose1, dose2])
        expect(other_user.basal_doses).to match_array([other_user_dose1, other_user_dose2])
      end
    end

    context "bolus doses" do
      it "can have many bolus doses" do
        dose1 = BolusDose.create!(amount: 2, time_stamp: "12:00", user: user)
        dose2 = BolusDose.create!(amount: 5, time_stamp: "12:00", user_id: user.id)

        expect(user.bolus_doses).to match_array([dose1, dose2])
      end

      it "separates doses by user" do
        dose1 = BolusDose.create!(amount: 2, time_stamp: "12:00", user: user)
        dose2 = BolusDose.create!(amount: 5, time_stamp: "12:00", user_id: user.id)

        other_user = User.create!(first_name: "John", last_name: "Connor")

        other_user_dose1 = BolusDose.create!(amount: 12, time_stamp: "12:00", user: other_user)
        other_user_dose2 = BolusDose.create!(amount: 15, time_stamp: "12:00", user_id: other_user.id)

        expect(user.bolus_doses).to match_array([dose1, dose2])
        expect(other_user.bolus_doses).to match_array([other_user_dose1, other_user_dose2])
      end
    end

    context "glucose_readings" do
      it "can have many glucose_readings" do
        glucose_reading1 = GlucoseReading.create!(bg_value: 139, time_stamp: "12:00", user: user)
        glucose_reading2 = GlucoseReading.create!(bg_value: 145, time_stamp: "12:00", user_id: user.id)

        expect(user.glucose_readings).to match_array([glucose_reading1, glucose_reading2])
      end

      it "separates by user" do
        glucose_reading1 = GlucoseReading.create!(bg_value: 139, time_stamp: "12:00", user: user)
        glucose_reading2 = GlucoseReading.create!(bg_value: 145, time_stamp: "12:00", user_id: user.id)

        other_user = User.create!(first_name: "John", last_name: "Connor")

        other_user_glucose_reading1 = GlucoseReading.create!(bg_value: 175, time_stamp: "12:00", user: other_user)
        other_user_glucose_reading2 = GlucoseReading.create!(bg_value: 180, time_stamp: "12:00", user_id: other_user.id)

        expect(user.glucose_readings).to match_array([glucose_reading1, glucose_reading2])
        expect(other_user.glucose_readings).to match_array([other_user_glucose_reading1, other_user_glucose_reading2])
      end
    end
  end
end  