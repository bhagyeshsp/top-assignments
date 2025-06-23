# This module loads word dictionary
module Dictionary
  def open_dictionary
    file = File.open("google-10000-english-no-swears.txt", "r")
    file.readlines(chomp: true)
  end

  def filter_lines(lines_array)
    lines_array.select { |line| line.length.between?(5, 12) }
  end
end
