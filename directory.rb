def interactive_menu
  @students = []
  loop do
    print_menu
    selection = STDIN.gets.chomp
    process(selection)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
      puts "students inputted"
    when "2"
      show_students
      puts "students shown"
    when "3"
      save_students
      puts "students saved"
    when "4"
      try_load_students
      puts "load completed"
    when "9"
      puts "goodbye!"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to students.csv"
  puts "4. Load the students from students.csv"
  puts "9. Exit"
end

def show_students
  print_header_student_list
  print_students_list
  print_footer_student_list
end

def input_start_text
  puts "Please enter the names of the students and their cohort separated by a space"
  puts "After this, please input a fun fact about the student!"
  puts "To finish, just hit return three times"
  @students = []
end

def input_students
  input_start_text
  name = STDIN.gets.chomp
  fact = STDIN.gets.chomp
  while !name.empty? do
    name_cohort = name.split(" ")
    @students << {name: name_cohort[0],cohort: name_cohort[1],facts: fact}
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
    fact = STDIN.gets.chomp
  end
  @students
end

def print_header_student_list
  puts "The students of Villains Academy"
  puts "-------------"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |stu|
    student_data = [stu[:name],stu[:cohort],stu[:facts]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  puts "What file would you like?"
  filename = STDIN.gets.chomp
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, fact = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, facts: fact}
  end
  file.close  
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

def print_footer_student_list
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students"
  elsif @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "We have no students!"
  end
end

interactive_menu