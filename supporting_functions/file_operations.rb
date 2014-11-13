# Generates an array of strings, each string represents a line from the file 'fileName'
def fileToArray(fileName)
    lines = Array.new
    File.foreach(fileName).with_index { |line|
        lines << line.chomp
    }
    return lines
end
