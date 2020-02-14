require_relative 'global'
# require 'pry'

# $current_student_id = 1
#lecture_id = lecture_id
#date_created = 
def create_entry
    system("clear")
    puts "Gaal_Williams Code Camp"
    puts "-"*100
    puts "Session for user:  #{$current_student.username}"
    puts "="*100
    sleep(0.5)
    puts "Creating Journal for Lecture: #{Lecture.find($current_lecture_id).name}"
    puts "-"*100
    JournalEntry.create(lecture_id: $current_lecture_id, student_id: $current_student_id, what_did_i_learn: $prompt.ask("What did you learn?", required: true), what_was_unclear: $prompt.ask("What was not clear?", required: true), confidence_level: $prompt.select('How confident are you in the material?', [1, 2, 3, 4, 5], required: true), feelings_on_topic: $prompt.ask("How did you feel about the lecture content?", required: true), feelings_general: $prompt.ask("How do you personally feel today?", required: true), mood: $prompt.select("Rate your mood (5-best, 1-worst", [1, 2, 3, 4, 5], required: true))

    $current_journal_id = JournalEntry.last.id
    display_journal_entry($current_journal_id)
end
