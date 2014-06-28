#!/usr/bin/env rake

require 'twitter_sir_archibald'

task :default => 'twitter:check_new_tweets'

namespace 'twitter' do
  desc "check new tweets."
  task :check_new_tweets do
    puts "Checking New Tweets....."
    Sir_Archibald.run_once
  end
end

# for app in `heroku apps | tail +2`; do heroku apps:destroy --app $app --confirm $app; done