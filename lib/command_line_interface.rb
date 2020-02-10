def welcome
  puts "Welcome to this Star Wars API."
  # puts out a welcome message here!
end

def get_character_from_user
  puts "please enter a Star Wars character name"
  character = gets.chomp.to_s
  character
  # use gets to capture the user's input. This method should return that input, downcased.
end
