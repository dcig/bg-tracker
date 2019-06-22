FactoryBot.define do
    factory :bolus_dose do
        user
        amount {5}
        time_stamp {Time.zone.now}
    end
  end