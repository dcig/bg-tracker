class GlucoseReading < ApplicationRecord
    def bg_data
        response = GET #this is the GET from dexcoms api, so GET egv 
        response = [""][""] #in the [] enter the specific JSON value type from ^ get response
    end
end
