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
            #GET request for bg values
            access_token = Dexcom::Authorization.new(@user).access_token
            response = RestClient.get 'https://sandbox-api.dexcom.com/v2/users/self/egvs?startDate=2017-06-16T17:00:00&endDate=2017-06-16T17:15:00', {Authorization: => 'Bearer access_token', accept: :json}
            puts response.body

            evgs_payload = JSON.parse(response.body, symbolize_names: true)

            GlucoseReading.create!(
                access_token: oauth_payload[:access_token],
                expires_in: oauth_payload[:expires_in],
                refresh_token: oauth_payload[:refresh_token],
                user: @user
            )
           # {
           #     "unit": "mg/dL",
           #     "rateUnit": "mg/dL/min",
           #     "egvs": [
           #        {
           #             "systemTime": "2017-06-16T17:10:00",
           #             "displayTime": "2017-06-16T09:10:00",
           #             "value": 183,
           #             "status": null,
           #             "trend": "flat",
           #             "trendRate": 0.4,
           #             "realtimeValue": 183,
           #             "smoothedValue": null
           #         },
           #         {
           #             "systemTime": "2017-06-16T17:05:00",
           #             "displayTime": "2017-06-16T09:05:00",
           #             "value": 181,
           #             "status": null,
           #             "trend": "flat",
           #             "trendRate": 0.5,
           #             "realtimeValue": 181,
           #             "smoothedValue": null
           #         },
           #         {
           #             "systemTime": "2017-06-16T17:00:00",
           #             "displayTime": "2017-06-16T09:00:00",
           #             "value": 179,
           #             "status": null,
           #             "trend": "flat",
           #             "trendRate": 0.6,
           #             "realtimeValue": 179,
           #             "smoothedValue": null
           #         }
           #     ]
           # }
    end
end
