class Capybara
  def initialize name
    @name = name
    @asleep = false
    @mood = 25
    @food = 23
    @energy = 25

    puts 'You have been gifted a capybara on your birthday o_O'
    puts "His name is #{@name}"
  end

  def help
    puts 'List of all commands:'
    puts 'feed'
    puts 'swim'
    puts 'putToBed'
    puts 'scratchBelly'
    puts 'run'
    puts 'kill'
  end

  def kill
    puts 'You\'ve killed your capybara!!'
    exit
  end

  def feed
    puts "You give #{@name} some tasty food"
    @food = @food + 5
    @mood = @mood + 3
    @energy = @energy + 5

    passageOfTime
  end

  def swim
    puts 'Capybaras like to swim!But they become exhausted!'
    @mood = @mood + 3
    @energy = @energy - 5
    passageOfTime
  end

  def putToBed
    puts 'You let your pet sleep a bit'
    @asleep = true
    3.times do
      if @asleep
        puts 'Zzzzz.....'
      end
    end
    @energy = @energy + 5
    passageOfTime
    if @asleep
      @asleep = false
      puts @name + ' is awake and waiting for adventures!'
    end
  end

  def scratchBelly
    puts "You scratch #{@name}'s belly. It definitely makes him happy!"
    @mood = @mood + 5
    @energy = @energy - 5
    passageOfTime
  end

  def run
    puts "Oh no!Your little capybara is being hunted!Run, #{@name}, run!"
    @energy = @energy - 5
    @mood = @mood - 5
    @food = @food - 5
    passageOfTime
  end

  private

  def hungry?
    @food <= 5
  end

  def overweight?
    @food >= 25
  end

  def gloomy?
    @mood <= 5
  end

  def happy?
    @mood >= 35
  end

  def sleepy?
    @energy <= 5
  end

  def passageOfTime
    if @energy > 1
      @energy = @energy - 3
    else
      puts "Let #{@name} sleep a while, you heartless beast!"
    end
    if @food > 0
      @food = @food - 3
    else
      puts 'What have you done?!You\'ve starved poor capybara to death!'
      exit
    end

    if hungry?
      if @asleep
        @asleep = false
        puts @name + ' needs something to eat for better sleep!'
      end
      @mood = @mood - 5
      puts "Seems like #{@name}'s not so happy as it used to be.."
    end

    if sleepy?
      @mood = @mood - 5
      puts @name + '\'s no toy, it needs some sleep from time to time!'
    end

    if overweight?
      @mood = @mood - 5
      puts "Please stop feeding #{@name}, can't you see it's already overweight?"
    end

    if gloomy?
      puts "Capybaras are sweet and joyful but you've managed to make #{@name} really upset!"
    end

    if happy?
      puts "Look, seems like #{@name} is smiling!"
    end

  end
end

puts 'How would you call your pet?'
name = gets.chomp
pet = Capybara.new (name)

puts 'Here is the list of commands which you can apply to your pet'
puts pet.help
puts 'Type \'help\' for the list of commands'

loop do
  action = gets.chomp

  case action
    when 'feed' then pet.feed
    when 'swim' then pet.swim
    when 'putToBed' then pet.putToBed
    when 'scratchBelly' then pet.scratchBelly
    when 'run' then pet.run
    when 'help' then pet.help
    when 'kill' then pet.kill
  end
end
