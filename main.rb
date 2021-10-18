require 'telegram/bot'

TOKEN   = 'your:telegram_token'
TEXT    = "Розпочнемо чаклування! Сконцентруйтесь на своїх бажаннях... Задайте питання, на яке можна відповісти 'так' або 'ні'... і духи дадуть вам відповідь"
ANSWERS = [
  "Можливо",
  "Думаю що так",
  "Так",
  "Не можу сказати",
  "Думаю що ні",
  "Смутно",
  "Точно ні",
  "Дуже ймовірно",
  "Точно так",
  "Запитайте знову",
  "Шанси хороші",
  "Духи говорять ні",
  "Шансів мало",
  "Ні",
  "Запитайте пізніше",
  "Незрозуміло",
  "Духи говорять так",
  "Без сумнівів",
  "Є сумніви",
  "Не зараз"
]

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start', '/start start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text:    "Привіт, #{message.from.first_name}! #{TEXT}"
      )
    else
      bot.api.send_message(
        chat_id: message.chat.id,
        text:    ANSWERS.sample
      )
    end
  end
end
