require 'rubygems'
require 'telegram/bot'

token = '1585295871:AAFO1bvzpcjHhpB4oTOjeXUsbZ-zulrjgTE'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Привет, #{message.from.first_name}! Профком студентов МГТУ приветствует тебя!")
      bot.api.send_message(chat_id: message.chat.id, text: "Какое мероприятие ты хотел бы посетить?")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end