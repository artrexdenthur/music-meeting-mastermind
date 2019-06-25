class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]
  has_one :profile, class_name: 'Singer'
  accepts_nested_attributes_for :profile, reject_if: :all_blank
  
  after_initialize :init_profile
  has_many :singers
  has_many :choruses
  # has_secure_password

  def init_profile
    build_profile if profile == nil
    true
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def singer_id=(id)
    s = Singer.find_by_id(id)
    profile = s
  end

  def singer_id

  end
end
