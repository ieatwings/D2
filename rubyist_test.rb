require 'minitest/autorun'
require_relative 'rubyist'
# Class to test Rubyists class
class RubyistTest < Minitest::Test

	# Setup Rubyists class for testing methods
	def setup
		@rubyists = Rubyist.new
		@rubyists.prng = Random.new(6)
	end

	# Test that checks if instance of Rubyist class has be established.
	def test_rubyists
		refute_nil(@rubyists)
		assert_kind_of(Rubyist, @rubyists)
	end


	# UNIT TEST FOR METHOD initialization()
	# Tests that variables for Rubyist class are initiated.
	def test_init
		assert_nil(@rubyists.num_turns)
		assert_equal('Enumerable Canyon', @rubyists.current_city)
		assert_equal(false, @rubyists.next_city)
		assert_equal(0, @rubyists.rubies_found)
		assert_equal(0, @rubyists.fake_rubies_found)
		assert_equal(0, @rubyists.total_rubies)
		assert_equal(0, @rubyists.total_fake_rubies)
		assert_equal(0, @rubyists.total_days)
	end


	# STUB TESTS
	# ----------
	# UNIT TESTS FOR METHOD *_travel
	# Equivalence classes: 
	# Map of locations and connections:

	# Nil Town-----------------------------
	#      \                              |
	#       \                             |
	#   Monkey Patch City                 |
	#        |     \       /---------- Hash Crossing
	#        |     Matzburg----              |
	#        |            |    \             |
	#        |            |     \---------- Dynamic Palisades
	#        |            \____
	#        |                |
	# Enumerable Canyon ---- Duck Type Beach

	# Tests will use stubbing to enforce an action so that we may be sure it worked properly. Stubbing of invalid data should return false.
	def test_dtb_travel_to_m
		@rubyists.stub(:dtb_travel, 'Matzburg') do
			@rubyists.current_city = 'Duck Type Beach'
			@rubyists.travel
			assert_equal('Matzburg', @rubyists.current_city)
		end
	end

	def test_dtb_travel_to_ec
		@rubyists.stub(:dtb_travel, 'Enumerable Canyon') do 
			@rubyists.current_city = 'Duck Type Beach'
			@rubyists.travel
			assert_equal('Enumerable Canyon', @rubyists.current_city)
		end
	end

	def test_ec_travel_to_mpc
		@rubyists.stub(:ec_travel, 'Monkey Patch City') do
			@rubyists.current_city = 'Enumerable Canyon'
			@rubyists.travel
			assert_equal('Monkey Patch City', @rubyists.current_city)
		end
	end

	def test_ec_travel_to_dtb
		@rubyists.stub(:ec_travel, 'Duck Type Beach') do
			@rubyists.current_city = 'Enumerable Canyon'
			@rubyists.travel
			assert_equal('Duck Type Beach', @rubyists.current_city)
		end
	end

	def test_mpc_travel_to_nt
		@rubyists.stub(:mpc_travel, 'Nil Town') do 
			@rubyists.current_city = 'Monkey Patch City'
			@rubyists.travel
			assert_equal('Nil Town', @rubyists.current_city)
		end
	end

	def test_mpc_travel_to_hc
		@rubyists.stub(:mpc_travel, 'Matzburg') do 
			@rubyists.current_city = 'Monkey Patch City'
			@rubyists.travel
			assert_equal('Matzburg', @rubyists.current_city)
		end
	end

	def test_mpc_travel_to_ec
		@rubyists.stub(:mpc_travel, 'Enumerable Canyon') do
			@rubyists.current_city = 'Monkey Patch City'
			@rubyists.travel
			assert_equal('Enumerable Canyon', @rubyists.current_city)
		end
	end

	def test_nt_travel_to_mpc
		@rubyists.stub(:nt_travel, 'Monkey Patch City') do 
			@rubyists.current_city = 'Nil Town'
			@rubyists.travel
			assert_equal('Monkey Patch City', @rubyists.current_city)
		end
	end

	def test_nt_travel_to_hc
		@rubyists.stub(:nt_travel, 'Hash Crossing') do 
			@rubyists.current_city = 'Nil Town'
			@rubyists.travel
			assert_equal('Hash Crossing', @rubyists.current_city)
		end
	end

	def test_nt_travel_to_ec
		@rubyists.stub(:nt_travel, 'Enumerable Canyon') do
			@rubyists.current_city = 'Nil Town'
			@rubyists.travel
			assert_equal('Enumerable Canyon', @rubyists.current_city)
		end
	end

	def test_m_travel_to_mpc
		@rubyists.stub(:m_travel, 'Monkey Patch City') do 
			@rubyists.current_city = 'Matzburg'
			@rubyists.travel
			assert_equal('Monkey Patch City', @rubyists.current_city)
		end
	end

	def test_m_travel_to_hc
		@rubyists.stub(:m_travel, 'Hash Crossing') do
			@rubyists.current_city = 'Matzburg'
			@rubyists.travel
			assert_equal('Hash Crossing', @rubyists.current_city)
		end
	end

	def test_m_travel_to_dp
		@rubyists.stub(:m_travel, 'Dynamic Palisades') do
			@rubyists.current_city = 'Matzburg'
			@rubyists.travel
			assert_equal('Dynamic Palisades', @rubyists.current_city)
		end
	end

	def test_m_travel_to_dtb
		@rubyists.stub(:m_travel, 'Duck Type Beach') do
			@rubyists.current_city = 'Matzburg'
			@rubyists.travel
			assert_equal('Duck Type Beach', @rubyists.current_city)
		end
	end

	def test_hc_travel_to_nt
		@rubyists.stub(:hc_travel, 'Nil Town') do
			@rubyists.current_city = 'Hash Crossing'
			@rubyists.travel
			assert_equal('Nil Town', @rubyists.current_city)
		end
	end

	def test_hc_travel_to_m
		@rubyists.stub(:hc_travel, 'Matzburg') do 
			@rubyists.current_city = 'Hash Crossing'
			@rubyists.travel
			assert_equal('Matzburg', @rubyists.current_city)
		end
	end

	def test_hc_travel_to_dp
		@rubyists.stub(:hc_travel, 'Dynamic Palisades') do 
			@rubyists.current_city = 'Hash Crossing'
			@rubyists.travel
			assert_equal('Dynamic Palisades', @rubyists.current_city)
		end
	end

	def test_dp_travel_to_hc
		@rubyists.stub(:dp_travel, 'Hash Crossing') do 
			@rubyists.current_city = 'Dynamic Palisades'
			@rubyists.travel
			assert_equal('Hash Crossing', @rubyists.current_city)
		end
	end

	def test_dp_travel_to_m
		@rubyists.stub(:dp_travel, 'Matzburg') do
			@rubyists.current_city = 'Dynamic Palisades'
			@rubyists.travel
			assert_equal('Matzburg', @rubyists.current_city)
		end
	end


	# UNIT TESTS FOR METHOD search_city

	# MAX_RUBIES & MAX_FAKE_RUBIES:
	
	# Location          | Max Rubies | Max Fake Rubies
  	# ------------------------------------------------
  	# Enumerable Canyon |    1       |    1
  	# Duck Type Beach   |    2       |    2
  	# Monkey Patch City |    1       |    1
  	# Nil Town          |    0       |    3
  	# Matzburg          |    3       |    0
  	# Hash Crossing     |    2       |    2
 	# Dynamic Palisades |    2       |    2
  	# ------------------------------------------------


	def test_search_city_ec
		@rubyists.current_city = 'Enumerable Canyon'
		@rubyists.search_city
		assert_equal(1, @rubyists.total_days)
		assert_operator 1, :>=, @rubyists.rubies_found
		assert_operator 1, :>=, @rubyists.total_rubies
		assert_operator 1, :>=, @rubyists.fake_rubies_found
		assert_operator 1, :>=, @rubyists.total_fake_rubies
	end

  	# Test when location is Duck Type Beach
	def test_search_city_dtb
		@rubyists.current_city = 'Duck Type Beach'
		@rubyists.search_city
		assert_equal(1, @rubyists.total_days)
		assert_operator 2, :>=, @rubyists.rubies_found
		assert_operator 2, :>=, @rubyists.total_rubies
		assert_operator 2, :>=, @rubyists.fake_rubies_found
		assert_operator 2, :>=, @rubyists.total_fake_rubies
	end

  	# Test when location is Monkey Patch City
	def test_search_city_mpc
		@rubyists.current_city = 'Monkey Patch City'
		@rubyists.search_city
		assert_equal(1, @rubyists.total_days)
		assert_operator 1, :>=, @rubyists.rubies_found
		assert_operator 1, :>=, @rubyists.total_rubies
		assert_operator 1, :>=, @rubyists.fake_rubies_found
		assert_operator 1, :>=, @rubyists.total_fake_rubies
	end

  	# Test when location is Nil Town
	def test_search_city_nt
		@rubyists.current_city = 'Nil Town'
		@rubyists.search_city
		assert_equal(1, @rubyists.total_days)
		assert_operator 0, :>=, @rubyists.rubies_found
		assert_operator 0, :>=, @rubyists.total_rubies
		assert_operator 3, :>=, @rubyists.fake_rubies_found
		assert_operator 3, :>=, @rubyists.total_fake_rubies
	end

  	# Test when location is Matzburg
	def test_search_city_m
		@rubyists.current_city = 'Matzburg'
		@rubyists.search_city
		assert_equal(1, @rubyists.total_days)
		assert_operator 3, :>=, @rubyists.rubies_found
		assert_operator 3, :>=, @rubyists.total_rubies
		assert_operator 0, :>=, @rubyists.fake_rubies_found
		assert_operator 0, :>=, @rubyists.total_fake_rubies
	end

  	# Test when location is Hash Crossing
	def test_search_city_hc
		@rubyists.current_city = 'Hash Crossing'
		@rubyists.search_city
		assert_equal(1, @rubyists.total_days)
		assert_operator 2, :>=, @rubyists.rubies_found
		assert_operator 2, :>=, @rubyists.total_rubies
		assert_operator 2, :>=, @rubyists.fake_rubies_found
		assert_operator 2, :>=, @rubyists.total_fake_rubies
	end

  	# Test when location is Dynamic Palisades
	def test_search_city_dp
		@rubyists.current_city = 'Dynamic Palisades'
		@rubyists.search_city
		assert_equal(1, @rubyists.total_days)
		assert_operator 2, :>=, @rubyists.rubies_found
		assert_operator 2, :>=, @rubyists.total_rubies
		assert_operator 2, :>=, @rubyists.fake_rubies_found
		assert_operator 2, :>=, @rubyists.total_fake_rubies
	end


	# UNIT TESTS FOR METHOD results
	# Equivalence classes:
	# rubies_found = 0 -> returns "Found 0 rubies"
	# rubies_found = 1 -> returns "Found 1 ruby"
	# rubies_found 2..INFINITY -> returns "Found 'x' rubies"
	
	# fake_rubies_found = 0 -> returns "Found 0 fake rubies"
	# fake_rubies_found = 1 -> returns "Found 1 fake ruby"
	# fake_rubies_found 2..INFINITY -> returns "Found 'x' fake rubies"

	def test_results_1
		@rubyists.results
		@rubyists.current_city = 'Enumerable Canyon'
		@rubyists.rubies_found = 2
		@rubyists.fake_rubies_found = 2
		assert_output(/Found 2 rubies and 2 fake rubies in Enumerable Canyon/) {@rubyists.results}
	end

	def test_results_2
		@rubyists.results
		@rubyists.current_city = 'Enumerable Canyon'
		@rubyists.rubies_found = 1
		@rubyists.fake_rubies_found = 1
		assert_output(/Found 1 ruby and 1 fake ruby in Enumerable Canyon/) {@rubyists.results}
	end

	def test_results_3
		@rubyists.results
		@rubyists.current_city = 'Enumerable Canyon'
		@rubyists.rubies_found = 2
		@rubyists.fake_rubies_found = 1
		assert_output(/Found 2 rubies and 1 fake ruby in Enumerable Canyon/) {@rubyists.results}
	end

	def test_results_4
		@rubyists.results
		@rubyists.current_city = 'Enumerable Canyon'
		@rubyists.rubies_found = 1
		@rubyists.fake_rubies_found = 2
		assert_output(/Found 1 ruby and 2 fake rubies in Enumerable Canyon/) {@rubyists.results}
	end

	def test_results_5
		@rubyists.results
		@rubyists.current_city = 'Enumerable Canyon'
		@rubyists.rubies_found = 2
		@rubyists.fake_rubies_found = 0
		assert_output(/Found 2 rubies in Enumerable Canyon/) {@rubyists.results}
	end

	def test_results_6
		@rubyists.results
		@rubyists.current_city = 'Enumerable Canyon'
		@rubyists.rubies_found = 1
		@rubyists.fake_rubies_found = 0
		assert_output(/Found 1 ruby in Enumerable Canyon/) {@rubyists.results}
	end

	def test_results_7
		@rubyists.results
		@rubyists.current_city = 'Enumerable Canyon'
		@rubyists.rubies_found = 0
		@rubyists.fake_rubies_found = 2
		assert_output(/Found 2 fake rubies in Enumerable Canyon/) {@rubyists.results}
	end

	def test_results_8
		@rubyists.results
		@rubyists.current_city = 'Enumerable Canyon'
		@rubyists.rubies_found = 0
		@rubyists.fake_rubies_found = 1
		assert_output(/Found 1 fake ruby in Enumerable Canyon/) {@rubyists.results}
	end

	def test_results_9
		@rubyists.results
		@rubyists.current_city = 'Enumerable Canyon'
		@rubyists.rubies_found = 0
		@rubyists.fake_rubies_found = 0
		assert_output(/Found no rubies or fake rubies in Enumerable Canyon/) {@rubyists.results}
	end


	# UNIT TESTS FOR METHOD *_travel
	# All of theses tests will brute_force test each helper function of travel()
	def test_ec_travel_random_num1
		@rubyists.random_num = 0
		assert_equal('Monkey Patch City', @rubyists.ec_travel)
	end

	def test_ec_travel_random_num2
		@rubyists.random_num = 1
		assert_equal('Duck Type Beach', @rubyists.ec_travel)
	end

	def test_dtb_travel_random_num1
		@rubyists.random_num = 0
		assert_equal('Enumerable Canyon', @rubyists.dtb_travel)
	end

	def test_dtb_travel_random_num2
		@rubyists.random_num = 1
		assert_equal('Matzburg', @rubyists.dtb_travel)
	end

	def test_mpc_travel_random_num1
		@rubyists.random_num = 0
		assert_equal('Nil Town', @rubyists.mpc_travel)
	end

	def test_mpc_travel_random_num2
		@rubyists.random_num = 1
		assert_equal('Matzburg', @rubyists.mpc_travel)
	end

	def test_mpc_travel_random_num3
		@rubyists.random_num = 2
		assert_equal('Enumerable Canyon', @rubyists.mpc_travel)
	end

	def test_nt_travel_random_num1
		@rubyists.random_num = 0
		assert_equal('Monkey Patch City', @rubyists.nt_travel)
	end

	def test_nt_travel_random_num2
		@rubyists.random_num = 1
		assert_equal('Hash Crossing', @rubyists.nt_travel)
	end

	def test_nt_travel_random_num3
		@rubyists.random_num = 2
		assert_equal('Enumerable Canyon', @rubyists.nt_travel)
	end

	def test_m_travel_random_num1
		@rubyists.random_num = 0
		assert_equal('Monkey Patch City', @rubyists.m_travel)
	end

	def test_m_travel_random_num2
		@rubyists.random_num = 1
		assert_equal('Hash Crossing', @rubyists.m_travel)
	end

	def test_m_travel_random_num3
		@rubyists.random_num = 2
		assert_equal('Dynamic Palisades', @rubyists.m_travel)
	end

	def test_m_travel_random_num4
		@rubyists.random_num = 3
		assert_equal('Duck Type Beach', @rubyists.m_travel)
	end

	def test_hc_travel_random_num1
		@rubyists.random_num = 0
		assert_equal('Nil Town', @rubyists.hc_travel)
	end

	def test_hc_travel_random_num2
		@rubyists.random_num = 1
		assert_equal('Matzburg', @rubyists.hc_travel)
	end

	def test_hc_travel_random_num3
		@rubyists.random_num = 2
		assert_equal('Dynamic Palisades', @rubyists.hc_travel)
	end

	def test_dp_travel_random_num1
		@rubyists.random_num = 0
		assert_equal('Hash Crossing', @rubyists.dp_travel)
	end

	def test_dp_travel_random_num2
		@rubyists.random_num = 1
		assert_equal('Matzburg', @rubyists.dp_travel)
	end



	# UNIT TEST FOR METHOD check_next_city
	# Equivalence classes:
	# rubies_found = 0 && fake_rubies_found = 0 -> return next_city = true
	# rubies_found = 1..INFINITY && fake_rubies_found = 1..INFINITY -> return next_city = false

	# Tests will check that rubyists only travels to next city if no rubies/fake rubies are found.
	def test_check_next_city_valid
		@rubyists.rubies_found = 0
		@rubyists.fake_rubies_found = 0
		@rubyists.check_next_city
		assert_equal(true, @rubyists.next_city)
	end

	def test_check_next_city_invalid
		@rubyists.rubies_found = 1
		@rubyists.fake_rubies_found = 1
		@rubyists.check_next_city
		assert_equal(false, @rubyists.next_city)
	end

end
