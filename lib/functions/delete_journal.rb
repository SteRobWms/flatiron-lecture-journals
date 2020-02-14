# require_relative 'global'

def delete_journal(id)
    if $prompt.yes?("Are you sure you want to DELETE this journal?")
        JournalEntry.destroy(id)
        puts "...INTO THE VOID"
        sleep(2.5)
        student_journal_list
    else
        puts "SAVED IT!"
        sleep(2.5)
        display_journal_entry(id)
    end
end