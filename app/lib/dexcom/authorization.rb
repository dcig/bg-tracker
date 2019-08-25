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

            if expired?(access_token)
                token = refresh_token!(token)
            end

            # token is an instance of the DexcomAccessToken model
            # token.access_token
        end
        private

        def current_access_token! 

            @user.token.access_token
            
            if 
                user.find(current_access_token)
            else
                token = create_token!(token)
            end
            # User "has one" dexcom access token
            # 1.  Use the user model and retrieve the latest access token
            # 2.  If no token has ever been created, create one
            # call create_token!
        end

        def expired?(token)
            # based on token expiration and created at, return true/false if token is expired
        end

        def create_token!
            require 'rest-client'

            RestClient.post "https://sandbox-api.dexcom.com/v2/oauth2/token", {'x' => 1}.to_json, {content_type: :json, accept: :json}

#{ENV['DEXCOM_URL']}/v2/oauth2/login?client_id=#{ENV['DEXCOM_ID']}&redirect_uri=#{ENV['DEXCOM_REDIRECT']}&response_type=code&scope=offline_access
            # use the dexcom client id, client secret, user's authorization token
            # to make an api request to dexcom
            # https://sandbox-api.dexcom.com/v2/oauth2/token (see postman)
            # retrive access_token, refresh_token, expires_in
            #  make an api request to the token endpoint.  It needs:
            #  params -- see the "params" we send in postman
            #  headeers -- see the "headers" we send in postman
            # create a new DexcomAccessToken with that info & related to this user

            # return that token
        end

        def refresh_token!(refresh_token)
        end
    end
end