class Authorization < ActiveRecord::Base
  belongs_to :user
  validates :provider, :uid, :presence => true

  def self.find_or_create(auth_hash)
    auth = find_or_create_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    auth.user = User.create!({:name => auth_hash.info.nickname, :email => auth_hash.info.email})
      # auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    auth
  end
end
