class Link < Post
  def initialize
    super
    @url = ''
  end

  def read_from_console
    puts "Адрес ссылки:"
    @url = STDIN.gets.encode("UTF-8").chomp
    puts "Описание ссылки:"
    @text = STDIN.gets.encode("UTF-8").chomp
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"
    return [@url, @text, time_string]
  end
end