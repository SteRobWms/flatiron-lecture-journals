class CreateJournalEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :journal_entries do |t|
      t.integer :student_id
      t.integer :lecture_id
      t.datetime :created_at
      t.string :what_did_i_learn
      t.string :what_was_unclear
      t.integer :confidence_level
      t.text :feelings_on_topic
      t.text :feelings_general
    end
  end
end
