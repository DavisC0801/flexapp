class Clients::BaseController < ApplicationController
  before_action :require_client

  def require_client
    raise ActionController::RoutingError.new('Not Found') if !current_client
  end
end
