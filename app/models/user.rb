class User < ApplicationRecord
  has_one :singer
  has_secure_password
  
end
