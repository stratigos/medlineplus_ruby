require 'webmock/rspec'

# Webmock allows stubbing of external http requests, and disables all other
#  requests outside of localdev.

# This begins the suite with external requests disabled.
WebMock.disable_net_connect! allow_localhost: true
# This begins the test suite allowing external requests.
# WebMock.allow_net_connect!
