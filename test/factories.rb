FactoryBot.define do 
  factory :user do
    email { "test@test.com" }
    encrypted_password { Devise::Encryptor.digest(User, 'noodle90') }
  end

  factory :chorus do
    name { "The Sound of the Chorus Singers" }
  end

  factory :singer do
    name { "Joe Singer" }
  end
end