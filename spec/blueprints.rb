require 'machinist/active_record'
require 'sham'
require 'forgery'

Sham.define do
  name { |i| NameForgery.full_name }
  email { |i| InternetForgery.email_address }
  username { |i| InternetForgery.user_name }
  title { |i| i.to_s + " - " + LoremIpsumForgery.words(5) }
  description { |i| i.to_s + " - " + LoremIpsumForgery.paragraphs(2) }
end

Dir[File.join(File.dirname(__FILE__), "blueprints", "*.rb")].each { |f| require f }