require 'minitest/autorun'
require_relative 'rubyist'
require_relative 'simulation'
# Class to test Prospects class
class ProspectsTest < Minitest::Test

	# Setup Simulation class for testing methods
	def setup
		@simulation = Simulation.new
		@rando = Random.new(10)
	end


	# Test that checks if the instance of Simulation class has been established.
	def test_simulation
		refute_nil(@simulation)
		assert_kind_of(Simulation, @simulation)
	end


	# UNIT TEST FOR METHOD initialization()
	# Tests that variables for Simulation class are initiated.
	def test_init
		assert_equal([], @simulation.rubyists)
		assert_equal(0, @simulation.num_prospectors)
		assert_nil(@simulation.curr_prospector)
		assert_equal(0, @simulation.prng)
		assert_equal(0, @simulation.num_turns)
	end


	# UNIT TESTS FOR METHOD final_results(num_rubyist)
	# Equivalence classes:
	# total_rubies = 0 || 2..INFINITY -> returns plural 'rubies'
	# total_rubies = 1 -> returns singular 'ruby'
	# total_fake_rubies = 0 || 2..INFINITY -> returns plural 'fake rubies'
	# total_fake_rubies = 1 -> returns singular 'fake ruby'

	# Test output when many rubies and fake rubies are found.
	def test_final_results_many_rubies
		@simulation.prep_hunt(@rando, 1, 1)
		@simulation.curr_prospector.total_rubies = 10
		@simulation.curr_prospector.total_fake_rubies = 10
		@simulation.curr_prospector.total_days = 3
		assert_output(/After 3 days, Rubyist 1 found:\n\t10 rubies.\n\t10 fake rubies./) { @simulation.final_results(0) }
	end

	# Test output when only one ruby is found.
	def test_final_results_one_ruby
		@simulation.prep_hunt(@rando, 1, 1)
		@simulation.curr_prospector.total_rubies = 1
		@simulation.curr_prospector.total_fake_rubies = 10
		@simulation.curr_prospector.total_days = 3
		assert_output(/After 3 days, Rubyist 1 found:\n\t1 ruby.\n\t10 fake rubies./) { @simulation.final_results(0) }
	end

	# Test output when only one fake ruby is found.
	def test_final_results_one_fakes
		@simulation.prep_hunt(@rando, 1, 1)
		@simulation.curr_prospector.total_rubies = 10
		@simulation.curr_prospector.total_fake_rubies = 1
		@simulation.curr_prospector.total_days = 3
		assert_output(/After 3 days, Rubyist 1 found:\n\t10 rubies.\n\t1 fake ruby./) { @simulation.final_results(0) }
	end


	# UNIT TESTS FOR METHOD end_of_day_emotions
	# Equivalence Classes:
	# total_rubies = 10..INFINITY -> returns 'Going home victorius!'
	# total_rubies = 1..9 -> returns 'Going home sad.'
	# total_rubies = 0 -> returns 'Going home empty-handed.'

	# Test when found 10 rubies
	def test_end_of_day_emotions_victorius
		@simulation.prep_hunt(@rando, 1, 1)
		@simulation.curr_prospector.total_rubies = 10
		assert_output(/Going home victorius!/) { @simulation.end_of_day_emotions }
	end

	# Test when found 5 rubies
	def test_end_of_day_emotions_sad
		@simulation.prep_hunt(@rando, 1, 1)
		@simulation.curr_prospector.total_rubies = 5
		assert_output(/Going home sad./) { @simulation.end_of_day_emotions }
	end

	# Test when found 0 rubies
	def test_end_of_day_emotions_depressed
		@simulation.prep_hunt(@rando, 1, 1)
		@simulation.curr_prospector.total_rubies = 0
		assert_output(/Going home empty-handed./) { @simulation.end_of_day_emotions }
	end

end
