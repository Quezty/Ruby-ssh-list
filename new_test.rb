require "tty-table"
require "tty-reader"

# Create a table
table_data = [["Row 1", "Data 1"], ["Row 2", "Data 2"], ["Row 3", "Data 3"]]
table = TTY::Table.new(header: ["Name", "Value"], rows: table_data)

reader = TTY::Reader.new

# State to keep track of selected row
selected_index = 0

# Method to render table with highlighting
def render_table(table, selected_index)
  system("clear") # Clear the terminal
  table.render do |renderer|
    renderer.border do
      left "|"
      mid "|"
      right "|"
    end
    renderer.row(selected_index) { |row| row.style(:bold, :cyan) } # Highlight row
  end
end



loop do
  render_table(table, selected_index)

  # Listen for key presses
  input = reader.read_keypress

  case input
  when "j", TTY::Reader::Keys::DOWN
    selected_index = (selected_index + 1) % table_data.size
  when "k", TTY::Reader::Keys::UP
    selected_index = (selected_index - 1) % table_data.size
  when "\r" # Enter key
    puts "You selected: #{table_data[selected_index][0]}"
    break
  when "q" # Quit
    break
  end
end
