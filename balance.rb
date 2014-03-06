require 'rubygems'
require 'curb'  
# require 'json'
require 'colorize'

doge_balance = ARGV[0]
initial_investment = ARGV[1]

doge_to_usd = Curl.post("http://api.vaultofsatoshi.com/public/ticker", {:order_currency => "DOGE", :payment_currency => "USD"})
doge_to_usd_avg_value = doge_to_usd.body_str.split("average_price")[1].split("value\":\"")[1].split("\"")[0]
doge_to_usd_close_value = doge_to_usd.body_str.split("closing_price")[1].split("value\":\"")[1].split("\"")[0]

doge_to_usd_balance = doge_to_usd_avg_value.to_f * doge_balance.to_f
total_earned = doge_to_usd_balance - initial_investment.to_f

puts Time.new
puts "USD Avg: #{doge_to_usd_avg_value} = 1 DOGE".yellow
puts "USD Close: #{doge_to_usd_close_value} = 1 DOGE".yellow
puts "Total: $#{doge_to_usd_balance.round(2)}".green

if(total_earned >= 0)
  puts "+$#{total_earned}".green
else
  total_earned
  puts "-$#{total_earned.abs}".red
end

# puts "93627 Doge was purchased for 95 USD, 1 LTC ($20), and .05 BTC ($20) ~= $145".red
