class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.references :trainer, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_num
      t.string :password_digest
    end
  end
end
