class User < ActiveRecord::Base

  include Authentication::ActiveRecordHelpers

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :skills
  validates :email, :presence => true # will want to add name later

  def add_provider(auth_hash)
    # check if the provider already exists to avoid duplication
    unless authorizations.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
      Authorization.create :user => self, :provider => auth_hash['provider'], :uid => auth_hash['uid']
    end
  end
end
