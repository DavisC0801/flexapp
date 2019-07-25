class AddClientToMealLogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :meal_logs, :client, foreign_key: true
  end
end
