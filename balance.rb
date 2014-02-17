require 'rubygems'
require 'curb'  
require 'json'
require 'colorize'

doge_balance = ARGV[0]

doge_to_usd = Curl.post("http://api.vaultofsatoshi.com/public/ticker", {:order_currency => "DOGE", :payment_currency => "USD"})
doge_to_usd_avg_value = doge_to_usd.body_str.split("average_price")[1].split("value\":\"")[1].split("\"")[0]
doge_to_usd_close_value = doge_to_usd.body_str.split("closing_price")[1].split("value\":\"")[1].split("\"")[0]

#btc_to_doge = Curl::Easy.perform("http://pubapi.cryptsy.com/api.php?method=singlemarketdata&marketid=132")
#btc_to_usd = Curl::Easy.perform("http://data.mtgox.com/api/1/BTCUSD/ticker")
#btc_to_doge_value = btc_to_doge.body_str.split("lasttradeprice\":\"")[1].split("\"")[0]
#btc_to_usd_value = btc_to_usd.body_str.split("avg\":")[1].split("value\":\"")[1].split("\"")[0]
#doge_in_btc = btc_to_doge_value.to_f * doge_balance.to_f

doge_to_usd_balance = doge_to_usd_avg_value.to_f * doge_balance.to_f
total_earned = doge_to_usd_balance - 95

puts Time.new
#puts "BTC: #{btc_to_doge_value}/1 DOGE".yellow
puts "USD Avg: #{doge_to_usd_avg_value} = 1 DOGE".yellow
puts "USD Avg: #{doge_to_usd_close_value} = 1 DOGE".yellow
puts "Total: $#{doge_to_usd_balance.round(2)}".green
puts "+$#{total_earned}".green

#puts "93627 Doge was purchased for 95 USD, 1 LTC ($20), and .05 BTC ($20) ~= $145".red
