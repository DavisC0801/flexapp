class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.belongs_to :trainer
      t.belongs_to :client
      t.index [:trainer_id, :client_id], unique: true
      t.timestamps
    end
  end
end
