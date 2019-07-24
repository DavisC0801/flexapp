class ClientDashboardFacade
  def initialize(client)
    @client = client
  end

  def meal_names
    @client.meal_logs
    binding.pry
  end

end
