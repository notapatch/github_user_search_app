# Webmock and RSpec know how to talk to each other
require "webmock/rspec"

# Allow selenium work but stub out external calls
WebMock.disable_net_connect!(allow_localhost: true)
