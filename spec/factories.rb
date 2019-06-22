FactoryBot.define do
    factory :user do
      first_name { "John" }
      last_name  { "Doe" }
      basal_insulin  { "Tresiba" }
      bolus_insulin  { "Novolog" }
      admin { false }
    end
  end