class CreateToneResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :tone_responses do |t|
      t.string :primary_tone
      t.string :secondary_tone
      t.references :journal_entry, foreign_key: true

      t.timestamps
    end
  end
end
