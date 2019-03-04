# Class that validates command line input arguments
class ArgumentCheck
  def arg_check(args)
    args.count == 3 && args[0].to_i && args[1].to_i > 0 && args[2].to_i > 0
  rescue StandardError
    false
  end
end
