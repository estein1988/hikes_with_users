require 'bundler/setup'
Bundler.require
require 'tty-spinner'

require_all 'lib'

ActiveRecord::Base.logger = nil