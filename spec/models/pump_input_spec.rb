require 'rails_helper'

RSpec.describe PumpInput do
  it 'persists a pump input' do
    pump_input = PumpInput.new({ amount: "2", time_stamp: "11:00"})
    pump_input.save!

    expect(pump_input).to be_persisted
  end
end  