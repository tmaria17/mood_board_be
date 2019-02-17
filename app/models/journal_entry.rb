class JournalEntry < ApplicationRecord
  belongs_to :user
  has_one :tone_response

  def self.find_user_daily_journal(user_id)
    JournalEntry.where(user_id: user_id).find_by(created_at: Date.today)
  end

  def get_tone_results
    service = WatsonToneService.new(self.entry_text)
    results = service.get_tone
    
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
    res = ToneResponse.where(journal_entry_id: self.id).select(:primary_tone, :primary_score, :id)
  end

  private

    def tone_analyzer_service
      WatsonToneService.new(self.entry_text)
    end

    def tone_analyzer_results
      tone_analyzer_service.get_tone
    end

end
