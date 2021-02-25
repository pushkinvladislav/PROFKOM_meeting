require File.expand_path('../../config/environment', __dir__)
require 'rubygems'
require 'telegram/bot'

token = '1585295871:AAFO1bvzpcjHhpB4oTOjeXUsbZ-zulrjgTE'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    user = if !TgUser.exists?(telegram_id: message.chat.id)
             TgUser.create(name: message.from.first_name, telegram_id: message.chat.id)
           else
             TgUser.find_by(telegram_id: message.chat.id)
           end

    case user.step

    when 'start'
      Student.create(event_id: message.text)
      user.step = 'second_name'
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: 'Введите фамилию')
    when 'second_name'
      student = Student.last
      student.second_name = message.text
      student.save
      user.step = 'first_name'
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: 'Введите имя')
    when 'first_name'
      student = Student.last
      student.first_name = message.text
      student.save
      user.step = 'email'
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: 'Введите email')
    when 'email'
      student = Student.last
      student.email = message.text
      student.save
      user.step = 'group'
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: 'Введите группу')
    when 'group'
      student = Student.last
      student.group = message.text
      student.save
      user.step = 'faculty'
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: 'Введите факультет')
    when 'faculty'
      student = Student.last
      student.faculty = message.text
      student.save
      user.step = 'bilet'
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: 'Введите номер студенческого билета')
    when 'bilet'
      student = Student.last
      student.bilet = message.text
      student.save
      user.step = 'phone'
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: 'Введите номер телефона')
    when 'phone'
      student = Student.last
      student.phone = message.text
      student.save
      user.step = 'vk_id'
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: 'Введите vk_id')
    when 'vk_id'
      student = Student.last
      student.vk_id = message.text
      student.save
      user.step = nil
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: 'Спасибо за регистрацию! Напишите /start, чтобы записаться еще на одно мероприятие')

    end

    case message.text
    when '/start' || 'старт'
      user.step = 'start'
      user.save
      bot.api.send_message(chat_id: message.chat.id,
                           text: "Привет, #{message.from.first_name}! Профком студентов МГТУ приветствует тебя!")
      events = Event.all
      events.each do |event|
        bot.api.send_message(chat_id: message.chat.id, text: "#{event.id}.#{event.name}")
      end
      bot.api.send_message(chat_id: message.chat.id, text: 'Какое мероприятие вы хотели бы посетить?')
    when '/stop'
      user.step = 'stop'
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end
