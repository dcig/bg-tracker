class User < ApplicationRecord
    has_many :basal_doses
    has_many :bolus_doses
    has_many :glucose_readings
end
