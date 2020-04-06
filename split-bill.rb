puts  "----------------------------"
puts  "****************************"
puts  "********* Split Fair *********"
puts  "****************************"
puts  "----------------------------"
# Sometime you want to do things with friends whom just can't afford
# Their incomes are a way to low, but they'd love to participate
# So according to your friends incomes let's split fair

@users = {}

continue = true

def add_a_user
  puts "Enter a friend's name"
  name = gets.chomp
  puts "Enter his salary "
  salary = gets.chomp.to_f
  @users.merge!({name.to_sym => salary })
  puts "Add a new user? y/n"
  @answer = gets.chomp.downcase
end

def add_a_bill(total_bill)
  puts "Enter the bill to split?"
  puts "The bill you entered is: #{@total_bill = gets.chomp.to_f}"
end

###start here:

puts "Add a new user? press'y'"
@answer = gets.chomp.downcase
while continue

  case @answer
  when  "y"
    add_a_user

  when  "n"
    add_a_bill(@total_bill)
    puts "*" *20
    puts "all salary #{total_salary = @users.values.inject(0,:+)}"
    puts "*" *20
    @users.each do |key, value|
      puts "#{key} earns $#{value.to_i}"
    end
    puts "*" *20
    @users.each do |key, value|
      puts "#{key} should pay: #{@total_bill * (value/total_salary).round(2)}"
    end

    continue = false

  else
    puts "what ??"
  end
end



