FactoryBot.define do
    factory :glucose_reading do
      user
      bg_value {5}
      time_stamp {Time.zone.now}
    end
  end