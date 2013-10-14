class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :authorizations
  has_many :skills
  validates :name, :email, :presence => true

  def add_provider(auth_hash)
    # check if the provider already exists to avoid duplication
    unless authorizations.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
      Authorization.create :user => self, :provider => auth_hash['provider'], :uid => auth_hash['uid']
    end
  end
end
