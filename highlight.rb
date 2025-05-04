require "tty-table"
require "pastel"

# Initialize Pastel for coloring
pastel = Pastel.new

# Define table data
headers = ["Hostname", "Model", "Fingerprinted?"]
rows = [
  ["tiny-junty", "Juniper EX-2200 C-12T", "yes"],
  ["ubuntu-box", "Lenovo Ideapad", "yes"]
]

# Define which row to color (0-based index)
highlighted_index = 1

# Apply coloring to the specific row
rows.each_with_index do |row, index|
  if index == highlighted_index
    row.map! { |cell| pastel.bold.yellow(cell) } # Apply bold yellow to all cells
  end
end

# Create and render the table
table = TTY::Table.new(header: headers, rows: rows)

puts table.render do |renderer|
  renderer.border do
    left "|"
    mid "|"
    right "|"
  end
end
