class Session < ApplicationRecord
  belongs_to :user

  has_secure_token :token

  scope :active, -> { where(revoked_at: nil) }

  def revoke!
    update!(revoked_at: Time.current)
  end
end
