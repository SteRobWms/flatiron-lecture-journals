# require_relative 'global'

def delete_journal(id)
    if $prompt.yes?("Are you sure you want to DELETE this journal?")
        JournalEntry.destroy(id)
        puts "...into the void"
        sleep(3)
        student_journal_list
    else
        puts "saved it"
        sleep(3)
        display_journal_entry(id)
    end
end