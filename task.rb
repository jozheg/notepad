require 'date'
class Task < Post

  def initialize
    super
    @due_date = Time.now
  end

  def read_from_console
    puts "Введите задачу"
    @text = STDIN.gets.encode("UTF-8").chomp
    puts "Укажите дату выполнения задачи в формате ДД.ММ.ГГГГ"
    input = STDIN.gets.encode("UTF-8").chomp
    @due_date = Date.parse(input)
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"
    deadline = "Крайний срок: #{@due_date}"
    return [deadline, @text, time_string]
  end
end