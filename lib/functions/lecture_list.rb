require 'pry'
require_relative 'global'

# $current_student_id = Student.first.id
# lecture_list = Lecture.all.map{|lecture| "#{lecture.name} - #{lecture.date}"}
def lecture_list_select
    $current_student = Student.find($current_student_id)
    # def make_lecture_hash
    lecture_hash = {}
    Lecture.all.each do |lecture|
        lecture_hash[lecture.name] = lecture.id
    end
    lecture_hash
    # end

    # lecture_hash = make_lecture_hash

    # binding.pry

    selected_lecture = $prompt.select("Select a lecture", lecture_hash)

    # p selected_lecture
    # until $prompt.yes?("Confirm?")
    #     selected_lecture = $prompt.select("Select a lecture", -> {lecture_hash})
    # end

    puts "Opening #{lecture_hash.key(selected_lecture)}"
    $current_lecture_id = selected_lecture

    # if $current_student.journal_entries == nil || 0
    #     create_entry
    # else
    journal_check = $current_student.journal_entries.find_by(lecture_id: $current_lecture_id)
    # end
    
    # binding.pry

    if journal_check != nil
        puts "A current journal entry is already created for this lecture. Going there now..."
        sleep(1)
        puts "."
        sleep(1)
        puts ".."
        sleep(1)
        puts "..."
        sleep(1)
        $current_journal_id = journal_check.id
        display_journal_entry($current_journal_id)
    else
        create_entry
    end
end
# lecture_list_select