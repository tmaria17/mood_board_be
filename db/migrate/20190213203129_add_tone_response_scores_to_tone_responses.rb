class AddToneResponseScoresToToneResponses < ActiveRecord::Migration[5.2]
  def up
    add_column :tone_responses, :primary_score, :decimal
    add_column :tone_responses, :secondary_score, :decimal
  end

  def down
    remove_column :tone_responses, :primary_score, :decimal
    remove_column :tone_responses, :secondary_score, :decimal
  end
end
