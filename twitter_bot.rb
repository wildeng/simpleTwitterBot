class TwitterBot
	require 'twitter'
        require 'mysql2'
        require_relative '/home/pi/Documents/ruby_test/credentials/constants'
        require 'logger'
        require 'date'
        
        log = Logger.new(Constants::LOG_FOLDER+Date.today.strftime("%Y%m%d")+'_indi_bot.log',"daily")
        log.debug(Time.now.strftime("%Y-%m-%d %H:%M:%S")+" "+" file created")
        begin
                client = Mysql2::Client.new(:host=>'localhost',:username=>Constants::USERNAME,:password=>Constants::TWITPASS,:database=>'twitter_bot_messages')
       	 	twitClient = Twitter::REST::Client.new do |config|
                	config.consumer_key        = Constants::CONSUMER_KEY
                	config.consumer_secret     = Constants::CONSUMER_SECRET
                	config.access_token        = Constants::ACCESS_TOKEN
                	config.access_token_secret = Constants::ACCESS_TOKEN_SECRET

        	end
	
		indi_tweets = client.query('SELECT * FROM messages where msg_sent=0');
        	indi_tweets.each do |single_tweet|
            		twitClient.update(single_tweet['msg_text'])
                        client.query('UPDATE messages set msg_sent=1 where id='+single_tweet['id'].to_i.to_s)
		end
                log.debug(Time.now.strftime("%Y-%m-%d %H:%M:%S")+" "+" activated")
	rescue => error
		log.error(Time.now.strftime("%Y-%m-%d %H:%M:%S")+" "+" an error occurred " + error.message)		
	end
      	
end


