class BgWorker
  include Sidekiq::Worker
  queue_as :default
  #I left sidekiq options as defaults which means it will retry. Too early to be concerned with failed jobs?
  def perform(bg_data)
    # Do something
    # Informs user estimated bg values are being retrieved
    puts "Gathering Blood Glucose (bg) Estimated Values"
  end
end
