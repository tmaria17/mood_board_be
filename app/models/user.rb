class User < ApplicationRecord
  validates_presence_of :email, :name
  # validates_presence_of :refresh_token
  has_many :affirmations
  has_many :journal_entries
  has_many :tone_responses, through: :journal_entries

  validates :email, uniqueness: true

  has_secure_password validations: false

  after_create do
    refresh_token = ibm_authorization_service.access_information[:refresh_token]
    self.update(refresh_token: refresh_token)
  end

  private
    def ibm_authorization_service
      @service ||= IbmApiAuthService.new
    end

end
