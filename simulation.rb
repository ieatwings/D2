require_relative 'rubyist'

# Class to begin Rubyist's Ruby Hunt simulation
class Simulation
  # These are for quick getter/setters of methods
  attr_accessor :rubyists
  attr_accessor :num_prospectors, :curr_prospector
  attr_accessor :num_turns, :prng

  # Initialization method for creating new Simulation objects
  def initialize
    @rubyists = []
    @num_prospectors = 0
    @curr_prospector = nil
    @prng = 0
    @num_turns = 0
  end

  # Method to convince prospectors to ride the "Ruby train".
  def create_prospectors(num)
    @rubyists = []
    i = 0
    while i < num
      @rubyists[i] = Rubyist.new
      @rubyists[i].prng = @prng
      @rubyists[i].num_turns = @num_turns
      i += 1
    end
    @rubyists
  end

  # Prep for hunt by setting variables and gearing up.
  def prep_hunt(prng, num_prospectors, num_turns)
    @prng = prng
    @num_prospectors = num_prospectors
    @num_turns = num_turns

    @rubyists = create_prospectors(num_prospectors)
    @curr_prospector = @rubyists[0]
  end

  # Begin hunting for rubies!
  def start_hunt
    i = 0
    while i < @num_prospectors
      puts "Rubyist ##{i + 1} starting in Enumerable Canyon"
      @curr_prospector = @rubyists[i]
      @curr_prospector.hunt_rubies

      # Show final results and display end-of-day emotions.
      final_results(i)
      end_of_day_emotions

      i += 1
    end
  end

  # Display final results of total rubies collected, per Rubyist.
  def final_results(num_rubyist)
    puts "After #{@curr_prospector.total_days} days, Rubyist #{num_rubyist + 1} found:\n"

    if @curr_prospector.total_rubies != 1
      puts "\t#{@curr_prospector.total_rubies} rubies."
    else
      puts "\t#{curr_prospector.total_rubies} ruby."
    end

    if @curr_prospector.total_fake_rubies != 1
      puts "\t#{@curr_prospector.total_fake_rubies} fake rubies."
    else
      puts "\t#{@curr_prospector.total_fake_rubies} fake ruby."
    end
  end

  # Hidden away to protect any sad feels...
  def end_of_day_emotions
    if @curr_prospector.total_rubies > 9
      puts 'Going home victorius!'
    elsif @curr_prospector.total_rubies > 0
      puts 'Going home sad.'
    else
      puts 'Going home empty-handed.'
    end
  end
end
