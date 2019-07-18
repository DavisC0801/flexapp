class User < ApplicationRecord
  has_and_belongs_to_many :clients,
                          :class_name => 'User',
                          :join_table => 'users_clients',
                          :foreign_key => 'trainer_id',
                          :association_foreign_key => "client_id"

  has_secure_password
end
