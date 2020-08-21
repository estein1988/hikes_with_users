require_relative 'config/environment'
require "tty-prompt"

# binding.pry

cli = Cli.new
cli.banner
cli.welcome