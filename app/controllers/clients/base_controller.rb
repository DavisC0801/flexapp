class Clients::BaseController < ApplicationController
  before_action :require_client

  def require_client
    render status: 404, file: "#{Rails.root}/public/404.html" if !current_client
  end
end
