require_relative 'global'
require 'pry'

$current_student_id = 0

def user_info
    temp_username = $prompt.ask('What is your username?', deafult: ENV['USER'])
    if !Student.find_by(username: temp_username)
        puts "Sorry, username #{temp_username} is not yet created. Please create new user"
    else
        puts "Welcome back, #{temp_username}!"
        temp_password = $prompt.mask("What is your password?")
        if Student.find_by(username: temp_username).password == temp_password
            $current_student_id = Student.find_by(username: temp_username).id
            puts "Login (Great) Success!"
        else
            puts "Username and Password do not match. Please try again"
        end
    end
end

# user_info
# binding.pry
0