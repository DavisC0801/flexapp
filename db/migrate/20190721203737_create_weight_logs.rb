class CreateWeightLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :weight_logs do |t|
      t.integer :weight
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
