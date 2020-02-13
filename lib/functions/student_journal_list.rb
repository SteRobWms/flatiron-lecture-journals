# require 'pry'
require_relative 'global'
# require_relative 'journal_entry'

def student_journal_list
    
    # $current_student_id = 1
    $current_student = Student.find($current_student_id)

    # binding.pry

    # def make_journal_hash
        journal_hash = {}
        $current_student = Student.find($current_student_id)
        if $current_student.journal_entries.count == 0
            puts "Sorry, no entires have been created"
            lecture_list_select
        else
        puts "Current Student: #{$current_student}"
        puts "Current Student Journals: #{$current_student.journal_entries}"
        
        $current_student.journal_entries.each do |entry|
            journal_hash["Lecture: #{entry.lecture.name} | Date Created: #{entry.created_at} | What I Learned: #{entry.what_did_i_learn[0..13]}..."] = entry.id
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