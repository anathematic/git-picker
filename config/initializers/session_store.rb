# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_git-picker_session',
  :secret      => 'aa5e62d19ba8c146a6908c33aa055f943a7d8cdb85344147b960ec51bfb83615e2fce75cf1dfe91306db7d98ecee5fafd3cbc53b645c855f8b8cf806af875820'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
