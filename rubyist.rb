# Class that simulates the life of a Rubyist.
class Rubyist
  attr_accessor :prng, :num_turns
  attr_accessor :rubies_found, :fake_rubies_found, :total_rubies, :total_fake_rubies, :total_days
  attr_accessor :cities, :current_city, :next_city
  attr_accessor :random_num

  def initialize
    @prng = prng
    @num_turns = num_turns

    @cities = ['Enumerable Canyon', 'Duck Type Beach', 'Monkey Patch City',
               'Nil Town', 'Matzburg', 'Hash Crossing', 'Dynamic Palisades']
    @current_city = 'Enumerable Canyon'
    @next_city = false
    @prev_city = @current_city

    @rubies_found = 0
    @fake_rubies_found = 0
    @total_rubies = 0
    @total_fake_rubies = 0
    @total_days = 0

    @random_num = 0
  end

  # Method to look around for rubies.
  def hunt_rubies
    i = 0
    while i < @num_turns
      @rubies_found = 0
      @fake_rubies_found = 0

      # Search the current city for any rubies.
      search_city
      # Once you don't find any rubies, display your results.
      results
      # Verify that you didn't find any rubies this time.
      check_next_city

      # Head to the next city.
      if @next_city
        @next_city = false
        # Decide where you want to go
        travel
        puts "Heading from #{@prev_city} to #{@current_city}"
        i += 1
      end
    end
  end

  # Method to determine how many rubies/fake rubies found per iteration.
  # Generates random number to decide within available bounds.
  def search_city
    if @current_city == 'Enumerable Canyon'
      @rubies_found = @prng.rand(2)
      @fake_rubies_found = @prng.rand(2)
      update_hunt
    elsif @current_city == 'Duck Type Beach'
      @rubies_found = @prng.rand(3)
      @fake_rubies_found = @prng.rand(3)
      update_hunt
    elsif @current_city == 'Monkey Patch City'
      @rubies_found = @prng.rand(2)
      @fake_rubies_found = @prng.rand(2)
      update_hunt
    elsif @current_city == 'Nil Town'
      @rubies_found = 0
      @fake_rubies_found = @prng.rand(4)
      update_hunt
    elsif @current_city == 'Matzburg'
      @rubies_found = @prng.rand(4)
      @fake_rubies_found = 0
      update_hunt
    elsif @current_city == 'Hash Crossing'
      @rubies_found = @prng.rand(3)
      @fake_rubies_found = @prng.rand(3)
      update_hunt
    elsif @current_city == 'Dynamic Palisades'
      @rubies_found = @prng.rand(3)
      @fake_rubies_found = @prng.rand(3)
      update_hunt
    end
  end

  # Method to update ruby/fake ruby count and increase total_days counter.
  def update_hunt
    @total_rubies += @rubies_found
    @total_fake_rubies += @fake_rubies_found
    @total_days += 1
  end

  # Method to display results of current iteration of hunt.
  def results
    if @rubies_found > 1 && @fake_rubies_found > 1
      puts "\tFound #{@rubies_found} rubies and #{@fake_rubies_found} fake rubies in #{@current_city}"
    elsif @rubies_found == 1 && @fake_rubies_found == 1
      puts "\tFound #{@rubies_found} ruby and #{@fake_rubies_found} fake ruby in #{@current_city}"
    elsif @rubies_found > 1 && @fake_rubies_found == 1
      puts "\tFound #{@rubies_found} rubies and #{@fake_rubies_found} fake ruby in #{@current_city}"
    elsif @rubies_found == 1 && @fake_rubies_found > 1
      puts "\tFound #{@rubies_found} ruby and #{@fake_rubies_found} fake rubies in #{@current_city}"
    elsif @rubies_found > 1 && @fake_rubies_found.zero?
      puts "\tFound #{@rubies_found} rubies in #{@current_city}"
    elsif @rubies_found == 1 && @fake_rubies_found.zero?
      puts "\tFound #{@rubies_found} ruby in #{@current_city}"
    elsif @rubies_found.zero? && @fake_rubies_found > 1
      puts "\tFound #{@fake_rubies_found} fake rubies in #{@current_city}"
    elsif @rubies_found.zero? && @fake_rubies_found == 1
      puts "\tFound #{@fake_rubies_found} fake ruby in #{@current_city}"
    elsif @rubies_found.zero? && @fake_rubies_found.zero?
      puts "\tFound no rubies or fake rubies in #{@current_city}"
    end
  end

  # Method to split off this verifying function for testing.
  def check_next_city
    @next_city = true if @rubies_found.zero? && @fake_rubies_found.zero?
  end

  # Method to decide what city to travel to next.
  # Generates random number to decide of path to take.
  def travel
    @prev_city = @current_city
    case @current_city
    when 'Enumerable Canyon'
      @random_num = @prng.rand(2)
      @current_city = ec_travel
    when 'Duck Type Beach'
      @random_num = @prng.rand(2)
      @current_city = dtb_travel
    when 'Monkey Patch City'
      @random_num = @prng.rand(3)
      @current_city = mpc_travel
    when 'Nil Town'
      @random_num = @prng.rand(3)
      @current_city = nt_travel
    when 'Matzburg'
      @random_num = @prng.rand(4)
      @current_city = m_travel
    when 'Hash Crossing'
      @random_num = @prng.rand(3)
      @current_city = hc_travel
    when 'Dynamic Palisades'
      @random_num = @prng.rand(2)
      @current_city = dp_travel
    end
  end

  # Methods to help with determining path to take when traveling between cities.
  # They're split into smaller & simpler case switches for ease of testing.
  def ec_travel
    case @random_num
    when 0
      'Monkey Patch City'
    when 1
      'Duck Type Beach'
    end
  end

  def dtb_travel
    case @random_num
    when 0
      'Enumerable Canyon'
    when 1
      'Matzburg'
    end
  end

  def mpc_travel
    case @random_num
    when 0
      'Nil Town'
    when 1
      'Matzburg'
    when 2
      'Enumerable Canyon'
    end
  end

  def nt_travel
    case @random_num
    when 0
      'Monkey Patch City'
    when 1
      'Hash Crossing'
    when 2
      'Enumerable Canyon'
    end
  end

  def m_travel
    case @random_num
    when 0
      'Monkey Patch City'
    when 1
      'Hash Crossing'
    when 2
      'Dynamic Palisades'
    when 3
      'Duck Type Beach'
    end
  end

  def hc_travel
    case @random_num
    when 0
      'Nil Town'
    when 1
      'Matzburg'
    when 2
      'Dynamic Palisades'
    end
  end

  def dp_travel
    case @random_num
    when 0
      'Hash Crossing'
    when 1
      'Matzburg'
    end
  end
end
