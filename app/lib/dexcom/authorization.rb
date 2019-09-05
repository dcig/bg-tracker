module Dexcom
    class Authorization

        # Can test in rails console:
        # user = User.find(1)
        # auth = Dexcom::Authorization.new(user)
        # auth.access_token

        attr_reader :user
        def initialize(user)
            @user = user
        end

        def access_token
            token = token.access_token
                
            elsif 

            refresh_token! if expired?(access_token)
            # token is an instance of the DexcomAccessToken model
            # token.access_token
        end

        private
        def current_access_token! 
            # User "has one" dexcom access token
            # 1.  Use the user model and retrieve the latest access token
            # 2.  If no token has ever been created, create one
            # call create_token!
            current_access_token = @user.token.access_token
            
            if 
                User.find(current_access_token)
            else
                token = create_token!(token)
            end
        end

        def expired?(token)
            # based on token expiration and created at, return true/false if token is expired
        end

        def create_token!
            require 'rest-client'
            require 'json'

            body = {
                :client_id => ENV['DEXCOM_ID'],
                :client_secret => ENV['DEXCOM_SECRET'],
                :code => 'authcode5',
                :grant_type => 'authorization_code',
                :redirect_uri => ENV['DEXCOM_REDIRECT']
              }
            # POST or PUT with a hash sends parameters as a urlencoded form body
            response = RestClient.post("https://sandbox-api.dexcom.com/v2/oauth2/token", body)
            puts response.body
                # "{
                # \"access_token\": \"{your_access_token}\",
                # \"expires_in\": 600,
                # \"token_type\": \"Bearer\",
                # \"refresh_token\": \"{your_refresh_token}\"
                # }"
            oauth_payload = JSON.parse(response.body, symbolize_names: true)
            access_token = oauth_payload[:access_token]

            @user.update!(dexcom_authorization_code: :access_token)
            # create a new DexcomAccessToken with that info & related to this user
            # return that token

        end
        def refresh_token!(refresh_token)
            require 'rest-client'
            require 'json'

            body = {
                :client_id => ENV['DEXCOM_ID'],
                :client_secret => ENV['DEXCOM_SECRET'],
                :refresh_token => 'refreshtoken5',
                :grant_type => 'refresh_token',
                :redirect_uri => ENV['DEXCOM_REDIRECT']
              }
            # POST or PUT with a hash sends parameters as a urlencoded form body
            response = RestClient.post("https://sandbox-api.dexcom.com/v2/oauth2/token", body)
            puts response.body
                # "{
                # \"access_token\": \"{your_access_token}\",
                # \"expires_in\": 600,
                # \"token_type\": \"Bearer\",
                # \"refresh_token\": \"{your_refresh_token}\"
                # }"
            oauth_payload = JSON.parse(response.body, symbolize_names: true)
            access_token = oauth_payload[:access_token]

            @user.update!(dexcom_authorization_code: :access_token)

        end
    end
end