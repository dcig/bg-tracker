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
            require 'json'

            # use the dexcom client id, client secret, user's authorization token
            # to make an api request to dexcom
            # https://sandbox-api.dexcom.com/v2/oauth2/token (see postman)
            
            # POST or PUT with a hash sends parameters as a urlencoded form body
            RestClient.post "https://sandbox-api.dexcom.com/v2/oauth2/token",
                {:client_id => ENV['DEXCOM_ID'],
                    :client_secret => ENV['DEXCOM_SECRET'],
                    :code => 'authcode5',
                    :grant_type => 'authorization_code',
                    :redirect_uri => ENV['DEXCOM_REDIRECT']}

                    #=> <RestClient::Response 200 "{\"access_to...">
             #{
                #"access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IncyYUVpQmRlMXBfNnNjZmMzXzFpeHFvaDVqTSIsImtpZCI6IncyYUVpQmRlMXBfNnNjZmMzXzFpeHFvaDVqTSJ9.eyJpc3MiOiJodHRwczovL3VhbTEuZGV4Y29tLmNvbS9pZGVudGl0eSIsImF1ZCI6Imh0dHBzOi8vdWFtMS5kZXhjb20uY29tL2lkZW50aXR5L3Jlc291cmNlcyIsImV4cCI6MTYzODcyOTE2MCwibmJmIjoxNTQ0MTIxMTYwLCJjbGllbnRfaWQiOiJLYlNMcW5xcGJHRVdmR0xua1lwaWxPa2x1ak9FUVBTWSIsInNjb3BlIjpbImVndiIsImNhbGlicmF0aW9uIiwiZGV2aWNlIiwic3RhdGlzdGljcyIsImV2ZW50Iiwib2ZmbGluZV9hY2Nlc3MiXSwic3ViIjoiOTM3YzIwYzctMjk4ZS00Mzc4LTg4YmEtMzllYThkNTMyMDA4IiwiYXV0aF90aW1lIjoxNTQ0MTIxMTI0LCJpZHAiOiJpZHNydiIsImp0aSI6ImJhYThjZGRhMGNlOTlhNzgxNTgyNTYxMGZiY2YxZGU5IiwiYW1yIjpbInBhc3N3b3JkIl19.QaqegOskvhjlkroPI72GDwBROT_ir3S05j0bjqFvWuhWc5BtT1YXoCH9OI-tTW9Pp-I-HMEh9ytu0mRTkA3rOHKj4SI-8XC_I8VBMwdS5Cm9mm-1HxJlcyRkUgmPVIxSXlGoFLI0xrPAkFYyVOReYs4yU5QzqXjV9agQ7FVUCONK6L-h3m03YeCh0hzKhw1VHzpvBJUSjY6j-8-ktn0Y_XoHWBET8Ep1GbdARNXpCxNdVyH_bK-Qqf2qVqT6zBml3idxcQjG-zPsUO5xGJEF3kekD4PzQev4JxA1O-Uht-dZqgGtcSAXuEp1fr5OIKtVAg0vqT_o37t_DoXjMlecWg",
                #"refresh_token": "refreshtoken5",
                #"expires_in": 600,
                #"token_type": "Bearer"
            #}

            #def as_json(*)
                #data = {
                    #"access_token":user.access_token,
                    #"refresh_token":user.refresh_token,
                    #"expires_in":user.expires_in,
                    #"token_type":user.token_type
                #}
            #end

            #  retrive access_token, refresh_token, expires_in
            #  make an api request to the token endpoint. 
            #  It needs:
            #  params -- see the "params" we send in postman
            #  headers -- see the "headers" we send in postman

            # create a new DexcomAccessToken with that info & related to this user

            # return that token

            #Normally, when you use RestClient.get or the lower level RestClient::Request.execute method: :get to retrieve data, 
            #the entire response is buffered in memory and returned as the response to the call.
            response = RestClient.get "https://sandbox-api.dexcom.com/v2/oauth2/token", {accept: :json}
            json = JSON.parse(response)
            json['code'] = response.code

            respone.body
            puts response.read_body
        end
        def refresh_token!(refresh_token)
            response = RestClient.get "https://sandbox-api.dexcom.com/v2/oauth2/token", {accept: :json}
            json = JSON.parse(response)
            json['code'] = response.code

        end
    end
end