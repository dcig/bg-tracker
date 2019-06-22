FactoryBot.define do
    factory :basal_dose do
        user
        amount {5}
        time_stamp {Time.zone.now}
    end
  end