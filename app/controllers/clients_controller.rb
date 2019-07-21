class ClientsController < ApplicationController
  def show
    if current_client && !current_client.weight_logs.empty?
      latest_log = current_client.weight_logs.latest
      if Date.today - latest_log.created_at.to_date > 7
        flash.alert = "It has been over a week since you've logged your weight"
      end
    else
      flash.alert = "You haven't logged your weight yet!"
    end
  end
end
