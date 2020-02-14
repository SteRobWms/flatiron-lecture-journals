require_relative 'global'
require 'pry'
def create_student
    system("clear")
    puts "Gaal_Williams Code Camp"
    puts "-"*100
    sleep(0.5)
    first_name = $prompt.ask("What is your first name?", required: true)
    last_name = $prompt.ask("What is your last name?", required: true)
    puts "Hi #{first_name} #{last_name}"
    temp_stud = Student.where(first_name: first_name, last_name: last_name)
    # binding.pry
    if temp_stud.count > 0
        puts "You may have an account already"
        if $prompt.select("Are any of these your username? Select 'false' if not.", temp_stud.map{|stud| stud.username}.push(false))
            return puts "Welcome back! Please go back and select 'Login'"
        else 
            puts "Okay, let's finish creating your account."
        end
    end
    age = $prompt.ask("How old are you?", required: true)
    gender = $prompt.select("What is your gender?", ["Male", "Female"], required: true)
    def username_is_unique(username)
        if Student.find_by(username: username)
            puts "Sorry, username '#{username}' is already taken, please try another."
            sleep(0.5)
            return false
        else
            puts "Username success"
            sleep(0.5)
            return true
        end
    end
    username = $prompt.ask("Please select a username", required: true)
    until username_is_unique(username)
        username = $prompt.ask("Please select another username", required: true)
    end
    password = $prompt.mask("Create a password", required: true)
    puts "Your password is #{password}"

    # cohort_id = $prompt.ask("Select your cohort")

    Student.create(username: username, password: password, first_name: first_name, last_name: last_name, age: age, gender: gender)

    $current_student_id = Student.last.id
    inner_menu
    # puts $current_student_id
end
# create_student