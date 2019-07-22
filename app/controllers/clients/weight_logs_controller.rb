class Clients::WeightLogsController < Clients::BaseController
  def new
    @log = WeightLog.new
  end

  def create
    @log = current_client.weight_logs.new(weight_params)
    if @log.save
      flash.notice = 'Successfully Logged Weight'
      redirect_to client_dashboard_path
    else
      render :new
    end
  end

  private

  def weight_params
    params.require(:weight_log).permit(:weight)
  end
end
