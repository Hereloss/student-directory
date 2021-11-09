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

def print(names)
  i = 0
  lengths = names.length
  if names.length != 0
    names.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort) - fun fact: #{student[:facts]}"
    end
  end
end

def print_footer(students)
  if students.count > 1
    puts "Overall, we have #{students.count} great students"
  elsif students.count == 1
    puts "Overall, we have #{students.count} great student"
  else
    puts "We have no students!"
  end
end

students = input_students
print_header
print(students)
print_footer(students)