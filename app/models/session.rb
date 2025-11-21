class Session < ApplicationRecord
  belongs_to :user

  has_secure_token :token

  scope :active, -> { where(revoked_at: nil) }

  def revoke!
    update!(revoked_at: Time.current)
  end

  def self.find_by_token!(token)
    find_by!(token: token, revoked_at: nil)
  end
end
