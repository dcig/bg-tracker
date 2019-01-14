require 'uri'
require 'net/http'
require 'json'  

class DexcomWorker
  include Sidekiq::Worker
  queue_as :default
  #Sidekiq options as defaults which means it will retry.
  def perform(last_retrieval_time)
     # Look up bg_date in the dexcom api, look for all data since last retrieval time. Save each glucose reading to the GlucoseReadingModel.
     last_retrieval_time.each do |last_retrieval_time| 
      
      url = URI("https://api.dexcom.com/v2/oauth2/token")
      
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      request = Net::HTTP::Post.new(url)
      request["content-type"] = 'application/x-www-form-urlencoded'
      request["cache-control"] = 'no-cache'
      request.body = "client_secret=8LdZB6yvPz1tQ3vC&client_id=Z1EZfUJo2AcPFbm9ex58CC3gvM46UQEt&code={your_authorization_code}&grant_type=authorization_code&redirect_uri=https://www.gigitracker.com/users/new/"
      
      response = http.request(request)
      puts response.read_body


    # Informs user estimated bg values are being retrieved
    puts "Gathering Blood Glucose (bg) Estimated Values"
  end
end




# You need to finish the above, which is the API call itself. It needs to go through the Oauth2 process 
# in order to get the rest of the information needed for the actual bg_data itself.

# don't forget to install rack-Oauth2 and the required files and same goes for Rspec (Rspec testing too?)
# Review MVC and how it all works and functions. Between the User, Client & Server
# Figure out hot to save the glucose reading (bg_data) to the GlucoseReadingModel

# Test it somehow?

#// Not sure why this is not a comment.
#// Finish above, left off at 5.2 "The First Form"
#// once form was built, need (just this form for now) to have fields
#// send the information to the database > Reloads page > asks want dexcom data?
#// Create link to initiate the API call and GET > POST json response from dexcom API
#// Send data to database > 
#// If time, display user name and current bg info on simple UI
