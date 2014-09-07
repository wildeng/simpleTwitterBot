simpleTwitterBot
================

Just a small exercise to evaluate twitter ruby gem. This script takes some messages from a database table and tweets them
To use the script you need to create a MySql database called twitter_bot_messages ( or whatever you want, just change the code),
the add a table using the provided template.

In my environment I have a cron job that runs the script a couple of times in a day and after posting the saved messages to twitter,
it updates their status, so that I can exclude them from the next post.

To run the script, you also need a Twitter API key associated with a verified account.

I made it just for fun, so use it at your own risk.
