require 'rest-client'
require 'json'

module Dexcom
    class Evgs
        
        attr_reader :user, :auth
        def initialize(user, auth)
            @user = user
            @authorization = auth
        end

        def authorization
            auth = Dexcom::Authorization.new(@user)
        end

        def dexcom_bg!
            access_token = Dexcom::Authorization.new(@user).access_token
            #Normally, when you use RestClient.get or the lower level RestClient::Request.execute method: :get to retrieve data, 
            #the entire response is buffered in memory and returned as the response to the call.
            body = {
                :client_id => ENV['DEXCOM_ID'],
                :client_secret => ENV['DEXCOM_SECRET'],
                :refresh_token => @user.refresh_token,
                :grant_type => 'refresh_token',
                :redirect_uri => ENV['DEXCOM_REDIRECT']
              }
            response = RestClient.get "https://sandbox-api.dexcom.com/v2/oauth2/token", {accept: :json}

    end
end
