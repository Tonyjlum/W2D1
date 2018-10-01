# PHASE 2
class NotFruitError < StandardError; end
class YearsKnowToSmallError < ArgumentError
  def initialize(msg="Years known too small to be best friends.")
    super
  end
end

class NoNameNoPastTimeError < StandardError
  def initialize(msg="No name or past-time for your friend?...Are they real?")
    super
  end
end

def convert_to_int(str)
  begin
  Integer(str)
  rescue StandardError
    nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise NotFruitError if maybe_fruit == "coffee"
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
  rescue NotFruitError
    retry
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise NoNameNoPastTimeError if name.length < 1 || fav_pastime.length < 1 
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  raise YearsKnowToSmallError if yrs_known < 5

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
