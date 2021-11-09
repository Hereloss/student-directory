def interactive_menu
  @students = []
  loop do
    print_menu
    selection = gets.chomp.to_i
    process(selection)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "Please enter the names of the students and their cohort separated by a space"
  puts "After this, please input a fun fact about the student!"
  puts "To finish, just hit return three times"
  students = []
  name = gets.chomp
  fact = gets.chomp
  while !name.empty? do
    name_cohort = name.split(" ")
    students << {name: name_cohort[0],cohort: name_cohort[1],facts: fact}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    fact = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  names = @students
  i = 0
  lengths = names.length
  if names.length != 0
    names.each do |student,cohort|
      puts "#{student[:name]} (#{student[:cohort]} cohort) - fun fact: #{student[:facts]}"
    end
  end
end

def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students"
  elsif @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "We have no students!"
  end
end

interactive_menu