# Suggested configurations from code with jason
# https://www.codewithjason.com/vcr-webmock-hello-world-tutorial/

VCR.configure do |c|
  # This is the directory where VCR will store its "cassettes", i.e. its
  # recorded HTTP interactions.
  c.cassette_library_dir = "spec/cassettes"

  # This line makes it so VCR and WebMock know how to talk to each other.
  c.hook_into :webmock

  # This line makes VCR ignore requests to localhost. This is necessary
  # even if WebMock's allow_localhost is set to true.
  #
  # ignore_localhost = true is equivalent to ignore_hosts 'localhost',
  # '127.0.0.1', '0.0.0.0'. It is particularly useful for when you use
  # VCR with a javascript-enabled capybara driver, since capybara boots
  # your rack app and makes localhost requests to it to check that it has
  # booted.
  c.ignore_localhost = true

  # ChromeDriver will make requests to chromedriver.storage.googleapis.com
  # to (I believe) check for updates. These requests will just show up as
  # noise in our cassettes unless we tell VCR to ignore these requests.
  c.ignore_hosts "chromedriver.storage.googleapis.com"
end
