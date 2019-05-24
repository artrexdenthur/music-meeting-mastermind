FactoryBot.define do 
  factory :user do
    email { "test@test.com" }
    encrypted_password { Devise::Encryptor.digest(User, 'noodle90') }
  end
end