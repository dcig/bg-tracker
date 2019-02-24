require 'rails_helper'

RSpec.describe User do
  it 'persists a user' do
    user = User.new({ first_name: "Dan", last_name: "Cigler", basal_insulin: "Tresiba", bolus_insulin: "Novolog", pump_or_mdi: "mdi"})

    user.save!

    expect(user).to be_persisted
  end
end  