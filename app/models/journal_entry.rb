class JournalEntry < ApplicationRecord
  belongs_to :user
  has_one :tone_response

  def self.find_user_daily_journal(user_id)
    JournalEntry.where(user_id: user_id).find_by(created_at: Date.today)
  end

  def get_tone_results
    results = tone_analyzer_results

    tones = results[:document_tone][:tones]
    update_data = {}
    if tones.length == 1
      update_data[:primary_tone] = tones.first[:tone_id]
      update_data[:primary_score] = tones.first[:score]
    else
      update_data[:primary_tone] = tones.first[:tone_id]
      update_data[:primary_score] = tones.first[:score]
      update_data[:secondary_tone] = tones.last[:tone_id]
      update_data[:secondary_score] = tones.last[:score]
    end

    ToneResponse.where(journal_entry_id: self.id).first_or_initialize.tap do |response|
      response.update(update_data)
      response.save
    end
  end

  def entry_tones
    tone_response
  end

  private
    def ibm_authorization_service
      @service ||= IbmApiAuthService.new(self.user_id)
    end

    def tone_analyzer_service
      token = ibm_authorization_service.refresh_access_token
      WatsonToneService.new(self.entry_text, token)
    end

    def tone_analyzer_results
      tone_analyzer_service.get_tone
    end

end
