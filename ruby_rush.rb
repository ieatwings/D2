# Brandon La - bnl22
# CS1632 Quality Assuarance
# Deliverable 2
require_relative 'simulation'
require_relative 'arg_check'

def arg_error
  puts 'Usage:'
  puts 'ruby ruby_rush.rb *seed* *num_prospectors* *num_turns*'
  puts '*seed* should be an integer'
  puts '*num_prospectors* should be a non-negative integer'
  puts '*num_turns* should be a non-negative integer'
  exit 1
end

# EXECUTION STARTS HERE

# Verify valid arguments
args = ArgumentCheck.new
valid_args = args.arg_check ARGV

# If valid, begin Rubyist's Ruby Hunt simulator. Else, display usage syntax and exit
case valid_args
when true
  prng = Random.new(ARGV[0].to_i)
  num_prospectors = ARGV[1].to_i
  num_turns = ARGV[2].to_i

  @ruby_hunt = Simulation.new

  @ruby_hunt.prep_hunt(prng, num_prospectors, num_turns)
  @ruby_hunt.start_hunt
when false
  arg_error
end
