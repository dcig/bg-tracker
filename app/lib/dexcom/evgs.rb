module Dexcom
    class Evgs

        attr_reader :user
        def initialize(user)
            @user = user
        end

        def dexcom_bg!
            require 'rest-client'
            require 'json'
            #Normally, when you use RestClient.get or the lower level RestClient::Request.execute method: :get to retrieve data, 
            #the entire response is buffered in memory and returned as the response to the call.
            response = RestClient.get "https://sandbox-api.dexcom.com/v2/oauth2/token", {accept: :json}

    end
end
