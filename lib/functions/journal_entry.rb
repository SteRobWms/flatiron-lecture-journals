require_relative 'global'
def display_journal_entry(id)
    $current_journal = JournalEntry.find(id)
    puts "Created on #{$current_journal.created_at}"
    puts "===================================================="
    puts "Username:                 #{$current_student.username}"
    puts "----------------------------------------------------"
    puts "Lecture:                  #{$current_journal.lecture.name}"
    puts "----------------------------------------------------"
    puts "Module:                   #{$current_journal.lecture.module}"
    puts "----------------------------------------------------"
    puts "What I learned:           #{$current_journal.what_did_i_learn}"
    puts "----------------------------------------------------"
    puts "What was unclear:         #{$current_journal.what_was_unclear}"
    puts "----------------------------------------------------"
    puts "Confidence level:         #{rating_stars($current_journal.confidence_level)}"
    puts "----------------------------------------------------"
    puts "Feelings on subject:      #{$current_journal.feelings_on_topic}"
    puts "----------------------------------------------------"
    puts "General feelings:         #{$current_journal.feelings_general}"
    puts "----------------------------------------------------"
    puts "Mood (1-worst, 5-best):   #{rating_stars($current_journal.mood)}"
    puts "===================================================="
    $prompt.select("What would you like to do next?") do |menu|
        menu.choice "Edit", -> {choose_edit}
        menu.choice "Delete Entry", -> {delete_journal($current_journal.id)}
        menu.choice "View Journal Entries", -> {student_journal_list}
        menu.choice "Back to Main Menu", -> {inner_menu}
    end
end
# display_journal_entry
# binding.pry
0
# display_journal_entry(1)