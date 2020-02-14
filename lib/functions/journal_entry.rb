require_relative 'global'
def display_journal_entry(id)
    system("clear")
    puts "Gaal-Williams Code Camp"
    puts "-"*100
    puts "Session for user:  #{$current_student.username}"
    puts "="*100
    puts
    puts
    sleep(0.5)
    $current_journal = JournalEntry.find(id)
    puts "Created on #{$current_journal.created_at}"
    puts "-"*100
    puts "Journal Entry for Lecture #{$current_journal.lecture.name}"    
    puts "="*100
    # puts "Username:                 #{$current_student.username}"
    puts "-"*100
    puts "Lecture:                  #{$current_journal.lecture.name}"
    puts
    puts "-"*100
    puts "Module:                   #{$current_journal.lecture.module}"
    puts
    puts "-"*100
    puts "What I learned:           #{$current_journal.what_did_i_learn}"
    puts
    puts "-"*100
    puts "What was unclear:         #{$current_journal.what_was_unclear}"
    puts
    puts "-"*100
    puts "Confidence level:         #{rating_stars($current_journal.confidence_level)}"
    puts
    puts "-"*100
    puts "Feelings on subject:      #{$current_journal.feelings_on_topic}"
    puts
    puts "-"*100
    puts "General feelings:         #{$current_journal.feelings_general}"
    puts
    puts "-"*100
    puts "Mood (1-worst, 5-best):   #{rating_stars($current_journal.mood)}"
    puts
    puts "="*100
    puts
    $prompt.select("What would you like to do next?") do |menu|
        menu.choice "Edit", -> {choose_edit}
        menu.choice "Delete Entry", -> {delete_journal($current_journal.id)}
        # menu.choice "View Journal Entries", -> {student_journal_list}
        menu.choice "Back to Main Menu", -> {inner_menu}
    end
end
# display_journal_entry
# binding.pry
0
# display_journal_entry(1)