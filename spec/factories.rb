FactoryBot.define do
    factory :user do
      first_name { "John" }
      last_name  { "Doe" }
      basal_insulin  { "Tresiba" }
      bolus_insulin  { "Novolog" }
      email {"johndoe@gmail.com"}
      password {"password"}
    end
  end