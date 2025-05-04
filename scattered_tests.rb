require 'tty-cursor'
require 'tty-screen'
require 'tty-box'
require 'tty-table'
require 'tty-prompt'
require 'tty-reader'
require 'pastel'

@cursor = TTY::Cursor
@size = TTY::Screen.size
@box = TTY::Box
@height = @size[0]
@width = @size[1]

def move_cursor_to_required_coordinates(text)
  x = (@size[1] - text.length) / 2
  y = (@size[0]) / 2
  print @cursor.move_to(x, y)
end

def centered_text(text)
  @cursor.clear_screen()
  move_cursor_to_required_coordinates(text)
  puts(text)
end

def draw_box(text)
  print @box.frame {text}
end

def draw_table
  @cursor.clear_screen()
  headers =  [
    "Hostname", 
    "Model", 
    "Fingerprinted?"
  ]
  rows = [
    ["tiny-junty", "Juniper EX-2200 C-12T", "yes"], 
    ["ubuntu-box", "Lenovo Ideapad", "yes"]
  ]
  table = TTY::Table.new(header: headers, rows: rows, )
  puts table.render do |renderer|
    # renderer.row(1) { |row| row.style(:bold, :yellow)}
    renderer.border.style = :green
  end


  # puts table.render(:unicode, alignments: [:left, :center, :right])
=begin
  reader = TTY::Reader.new
  reader.on(:keyctrl_x, :keyescape) do
    puts "Exiting..."
    exit
  end

  reader.on(:keypress) do |event|
    if event.value == "j"
      reader.trigger(:keydown)
    end
    if event.value == "j"
      reader.trigger(:keyup)
    end
  end



  loop do
    reader.read_line("=> ")
  end
=end
end

def impromptu
  prompt = TTY::Prompt.new
  answer = prompt.ask("What is your name?", default: ENV["user"])
  puts answer 
end

def moving_cursor()

end 


# centered_text("You did it!")
# draw_box("Hello world")
draw_table()
# impromptu()
# moving_cursor()