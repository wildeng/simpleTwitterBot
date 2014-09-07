

client = Mysql2::Client.new(:host=>'localhost',:username=>Constants::USERNAME,:password=>Constants::TWITPASS,:database=>'twitter_bot_messages')