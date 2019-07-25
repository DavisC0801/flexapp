class ClientsController < Clients::BaseController
  before_action :require_client

  def show
    if current_client && !current_client.weight_logs.empty?
      check_log_age
    else
      flash.alert = "You haven't logged your weight yet!"
    end
    render locals: {
      facade: ClientMealsFacade.new(current_client)
    }
  end

  private

  def check_log_age
    latest_log = current_client.weight_logs.latest
    if Date.today - latest_log.created_at.to_date > 7
      flash.alert = "It has been over a week since you've logged your weight"
    end
  end
end
