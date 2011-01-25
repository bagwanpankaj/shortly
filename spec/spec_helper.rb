$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'cgi'
require 'rspec'
require 'shortly'
require 'fakeweb'
# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
include FakewebStub
FakeWeb.allow_net_connect = false

RSpec.configure do |config|
  
end
