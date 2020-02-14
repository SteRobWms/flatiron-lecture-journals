require_relative 'global'

# $current_student_id = 0

def login
    # system("clear")
    temp_username = $prompt.ask('What is your username?', required: true)
    if !Student.find_by(username: temp_username)
        puts "Sorry, username #{temp_username} is not yet created. Please try again or create new user"
        sleep(1.5)
        main_menu
    else
        puts "Welcome back, #{temp_username}!"
        temp_password = $prompt.mask("What is your password?", required: true)
        if Student.find_by(username: temp_username).password == temp_password
            $current_student_id = Student.find_by(username: temp_username).id
            $current_student = Student.find($current_student_id)
            puts "Login (Great) Success!"
            sleep(0.5)
            inner_menu
        else
            puts "Username and Password do not match. Please try again"
            login
        end
    end
end

def inner_menu
    system("clear")
    puts "Gaal-Williams Code Camp"
    puts "-"*100
    puts "Session for user:  #{$current_student.username}"
    puts "="*100
    sleep(0.5)
    $prompt.select("What would you like to do?") do |menu|
        menu.choice "Look at my journal entries", -> {student_journal_list}
        menu.choice "Create a new journal entry", -> {lecture_list_select}
        # menu.choice "Display journal summaries", -> {journal_insights}
        menu.choice "Log out", -> {main_menu}
    end
end

# login
# binding.pry
# 0
# user_info