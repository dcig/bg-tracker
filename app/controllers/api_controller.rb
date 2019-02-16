class APIController < ApplicationController
def index
  #Ideally [below] is a button on a view that enables a user to start the process of synching the data from
  #dexcom's API to this app. 
  def gather_dexdata
    DexcomWorker.perform_async(bg_data)
    redirect_to root_path
  end
end
