require 'minitest/autorun'
require_relative 'arg_check'

# Class to test ArgumentCheck class
class ArgCheckTest < Minitest::Test

  # UNIT TESTS FOR METHOD arg_check(args)
  # Equivalence classes:
  # args = [x, 1..INFINITY, 1..INFINITY] -> returns true
  # args = [x, -INFINITY..-1, -INFINITY..-1] -> returns false
  # args = [x, NON-INTEGER, NON-INTERGER] -> returns false
  # args = [x, 0, 0] -> returns false

  # Test: zero command line arguments
  def test_arg_check_noArgs
  	@args = ArgumentCheck.new
    assert_equal(false, @args.arg_check([]))
  end

  # Test: one command line arguments
  def test_arg_check_oneArg
  	@args = ArgumentCheck.new
  	assert_equal(false, @args.arg_check([1]))
  end

  # Test: two command line arguments
  def test_arg_check_twoArg
  	@args = ArgumentCheck.new
  	assert_equal(false, @args.arg_check([2]))
  end

  # EDGE CASE
  # Test: zero for num_prospectors & num_turns
  def test_arg_check_zeroProspectsAndTurns
    @args = ArgumentCheck.new
    assert_equal(false, @args.arg_check([1, 0, 0]))
  end

  # EDGE CASE
  # Test: negatives for num_prospectors & num_turns
  def test_arg_check_negativeProspectsAndTurns
  	@args = ArgumentCheck.new
  	assert_equal(false, @args.arg_check([1, -1, -2]))
  end

  # Test: string argument
  def test_arg_check_1string
  	@args = ArgumentCheck.new
  	assert_equal(false, @args.arg_check(['poop']))
  end

  # EDGE CASE
  # Test: two string arguments
  def test_arg_check_2string
  	@args = ArgumentCheck.new
  	assert_equal(false, @args.arg_check(['poop', 'poopy']))
  end

  # EDGE CASE
  # Test: three string arguments
  def test_arg_check_3string
  	@args = ArgumentCheck.new
  	assert_equal(false, @args.arg_check(['poop', 'poopy', 'poopypoop']))
  end

  # Test: valid arguments
  def test_arg_check_validArgs
  	@args = ArgumentCheck.new
  	assert_equal(true, @args.arg_check([1, 1, 1]))
  end
end
