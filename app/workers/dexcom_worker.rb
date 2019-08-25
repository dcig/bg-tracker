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
      request.body = 
      
      response = http.request(request)
      puts response.read_body


    # Informs user estimated bg values are being retrieved
    puts "Gathering Blood Glucose (bg) Estimated Values"
  end
end