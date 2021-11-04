require 'telegram/bot'

TOKEN   = ENV['your_telegram_token']
TEXT    = "Let's start divination! Concentrate on your desires ... Ask a question that can be answered 'yes' or 'no' ... and the spirits will give you the answer"
ANSWERS = [
  "Maybe",
  "I think yes",
  "Yes",
  "I can't say",
  "I think not",
  "Fuzzily",
  "Definitely not",
  "Very likely",
  "Definitely yes",
  "Ask again",
  "The chances are good",
  "Spirits say no",
  "Chances are slim",
  "No",
  "Ask later",
  "Obscurely",
  "Spirits say yes",
  "Without a doubt",
  "There are doubts",
  "Not now"
]

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start', '/start start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text:    "Hi, #{message.from.first_name}! #{TEXT}"
      )
    else
      bot.api.send_message(
        chat_id: message.chat.id,
        text:    ANSWERS.sample
      )
    end
  end
end
