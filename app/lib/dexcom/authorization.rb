require 'rest-client'
require 'json'

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
            token = current_access_token!

            refresh_token!(token) if expired?(token)
            # token is an instance of the DexcomAccessToken model
            token.access_token
        end

        private
        def current_access_token! 
            # User "has one" dexcom access token
            # 1.  Use the user model and retrieve the latest access tokena
            # 2.  If no token has ever been created, create one
            # call create_token!

            # return @user.dexcom_access_token if @user.dexcom_access_token.present?
            #
            # create_token!

            current_access_token = @user.dexcom_access_token
            
            if current_access_token.present?
                return current_access_token
            else
                return create_token!
            end
        end

        def expired?(token)
            # based on token expiration and created at, return true/false if token is expired
            false
        end

        def create_token!
            body = {
                :client_id => ENV['DEXCOM_ID'],
                :client_secret => ENV['DEXCOM_SECRET'],
                :code => @user.dexcom_authorization_code,
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

            DexcomAccessToken.create!(
                access_token: oauth_payload[:access_token],
                expires_in: oauth_payload[:expires_in],
                refresh_token: oauth_payload[:refresh_token],
                user: @user
            )
        end

        def refresh_token!(token)
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
            refresh_token = oauth_payload[:refresh_token]

            @user.update!(dexcom_authorization_code: :refresh_token)

        end
    end
end