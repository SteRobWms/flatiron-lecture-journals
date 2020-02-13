require_relative 'global'

# $current_student_id = 0

def login
    temp_username = $prompt.ask('What is your username?', deafult: ENV['USER'])
    if !Student.find_by(username: temp_username)
        puts "Sorry, username #{temp_username} is not yet created. Please try again or create new user"
        main_menu
    else
        puts "Welcome back, #{temp_username}!"
        temp_password = $prompt.mask("What is your password?")
        if Student.find_by(username: temp_username).password == temp_password
            $current_student_id = Student.find_by(username: temp_username).id
            puts "Login (Great) Success!"
            inner_menu
        else
            puts "Username and Password do not match. Please try again"
            login
        end
    end
end

def inner_menu
    $prompt.select("What would you like to do?") do |menu|
        menu.choice "Look at my journal entries", -> {student_journal_list}
        menu.choice "Create a new journal entry", -> {lecture_list_select}
        menu.choice "Log out", -> {main_menu}
    end
end

# login
# binding.pry
# 0
# user_info