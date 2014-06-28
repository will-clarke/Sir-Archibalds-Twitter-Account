require 'twitter'

class Sir_Archibald

  def self.run_once
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["OAUTH_TOKEN"]
      config.access_token_secret = ENV["OAUTH_TOKEN_SECRET"]
    end


    t = client.search('"no manors"', :result_type => 'recent', :lang => 'en').first

        @name = t.user.name.split[0]
        @handle = t.user.screen_name

    if client.friends.include? t.user

        p "#@handle -- already a friend: #{t.text}"

    else
        client.follow @handle

        potential_tweets = [
        "@#{@handle} Oh No! No manors? Get in touch and I'll try to help out.",
        "@#{@handle} This saddens me deeply. #{@name}, I agree with you; poverty's a huge problem.",
        "@#{@handle} #{@name}, no manors? #firstworldproblems",
        "@#{@handle} #{@name}, this is truly tragic. Everyone should have at least one estate.",
        "@#{@handle} #{@name}, I am shocked to the core. Manors are important. I inherited mine.",
        "@#{@handle} Disgusting. Everyone should have at least a couple of manors.",
        "@#{@handle} Manors don't cost a penny - I inherited mine."
      ]

        random_tweet = potential_tweets.sample
        
        client.update random_tweet
        p random_tweet
        p 'OMG. TWEETED!!!!!'

        p "Tweeted: #{random_tweet}"

    end
  end
end

# heroku config:add CONSUMER_KEY=__CONSUMER_KEY__
# heroku config:add CONSUMER_SECRET=__CONSUMER_SECRET__
# heroku config:add OAUTH_TOKEN=__OAUTH_TOKEN__
# heroku config:add OAUTH_TOKEN_SECRET=__OAUTH_TOKEN_SECRET__
# heroku config:add USERNAME=__STELLAR_USERNAME__