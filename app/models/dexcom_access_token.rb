class DexcomAccessToken < ApplicationRecord
    belongs_to :user # foreign key - user_id
end
