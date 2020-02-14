# require 'pry'
require_relative 'global'
# require_relative 'journal_entry'

def student_journal_list
    $current_student = Student.find($current_student_id)
    system("clear")
    puts "Gaal-Williams Code Camp"
    puts "-"*100
    puts "Session for user:  #{$current_student.username}"
    puts "="*100
    sleep(0.5)
    # $current_student_id = 1
    # binding.pry
    # def make_journal_hash
        journal_hash = {}
        # $current_student = Student.find($current_student_id)
        if $current_student.journal_entries.count == 0
            puts "Sorry, no entries have been created"
            sleep(0.5)
            puts "Going to lecture list..."
            sleep(0.5)
            lecture_list_select
        else
        # puts "Current Student: #{$current_student}"
        # puts "Current Student Journals: #{$current_student.journal_entries}"
        
        $current_student.journal_entries.each do |entry|
            journal_hash["Lecture: #{entry.lecture.name} ----- What I Learned: #{entry.what_did_i_learn[0..13]}..."] = entry.id
        end
        journal_hash
    
    # end

    # make_journal_hash
    # binding.pry
    # def select_journal
    selected_journal = $prompt.select("What Journal do you want to view/modify?", journal_hash)
    # end
    # select_journal
    # p $current_journal_id

    # until $prompt.yes?("Confirm?")
    #     selected_journal = $prompt.select("What Journal do you want to view/modify?", journal_hash)
    # end

    $current_journal_id = selected_journal
    display_journal_entry($current_journal_id)
    # binding.pry

    # display_journal_entry($current_journal_id)
    end
end

# binding.pry
0
# student_journal_list