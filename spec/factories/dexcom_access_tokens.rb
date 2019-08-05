FactoryBot.define do
  factory :dexcom_access_token do
    access_token { "MyString" }
    expires_in { 1 }
    refresh_token { "MyString" }
  end
end
