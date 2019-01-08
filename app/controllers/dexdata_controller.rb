class DexDataController < ApplicationController

def gather_dexdata
    BgWorker.perform_async(bg_data)
    redirect_to root_path
  end