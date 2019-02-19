class CalendarDay
  attr_reader :id,
              :user_id,
              :date

  def initialize(user_id, date)
    @id = Time.now
    @user_id = user_id.to_i
    @date = date
    @_journal_object = nil
    @_tone_object = nil
    @_affirmation_objects = nil
  end

  def lookup_date
    Date.parse(date)
  end

  def journal_object
    @_journal_object ||= JournalEntry.by_date_and_user(lookup_date, user_id)
  end

  def tone_object
    journal_id = journal_object.id
    @_tone_object ||= ToneResponse.by_journal_entry(journal_id)
  end

  def affirmation_objects
    @_affirmation_objects ||= Affirmation.by_date_and_user(lookup_date, user_id, true)
  end

  def journal_entry_text
    journal_object.entry_text
  end

  def primary_tone
    tone_object.primary_tone
  end

  def primary_score
    tone_object.primary_score
  end

  def affirmations
    affirmation_objects.map do |affirmation|
      text = affirmation[:affirmation_text]
      result = {affirmation_text: text}
    end
  end

end
