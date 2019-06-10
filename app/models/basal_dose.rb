class BasalDose < ApplicationRecord
    belongs_to :user

    validate :time_stamp_format, on: :create

    private

    def time_stamp_format
        return if time_stamp_before_type_cast.match? /((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))/

        errors.add(:time_stamp, "invalid time stamp")
    end
end
