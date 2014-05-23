require 'twitter'

::Client = Twitter::REST::Client.new do |config|
  config.consumer_key = 'sEPjBJ4qBFisZjI6tsSR3Vm2U'
  config.consumer_secret = '83858dmyiTQbEFKBz80O8mj0LWw4iwZ1dGiKQlITMabOCDCV96'
  config.access_token = '258424459-OPZFO0Znbz5XYucti8mKEi6yyCk1SkwrEUkPdwnU'
  config.access_token_secret = 'hU2c0U8LpaGRd4I9damNxBxBzUugvvbeeRCEK1UIUiHcP'
end

# Client.search("to: surfing", :result_type => "recent").take(5).collect do |tweet|
#   Tweet.create("#{tweet.user.screen_name}:  #{tweet.text}")
# end

# Client.search("to: surfing", :result_type => "recent").take(5).collect do |tweet|
#   "#{tweet.user.screen_name}: #{tweet.text}"
#  end