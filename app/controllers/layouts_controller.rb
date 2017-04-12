require 'net/http'
class LayoutsController < ApplicationController
  LAYOUTS_DATA_URL = 'http://templates.shiyi.co/api/v1/layouts/2007'

  def index
    render json: load_data
  end

  private

  def load_data
    begin
      body = Net::HTTP.get URI(LAYOUTS_DATA_URL)
      JSON.parse body
    rescue Exception => e
      {error: e.message}
    end
  end
end
