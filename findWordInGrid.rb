# Generates an array of strings, each string represents a line from the file 'fileName'
def fileToArray(fileName)
    lines = Array.new
    File.foreach(fileName).with_index { |line|
        lines << line.chomp
    }
    return lines
end

def generateLetterGrid(width, height, acceptableLetters)

    grid = Hash.new

    # Iterate through each grid entry
    for y in 0..height-1 do
        for x in 0..width-1 do
        
            # Generate a random letter from the acceptable letters list
            # and set it to the grid entry
            grid[[x, y]] = acceptableLetters.sample
           
        end
    end 

    return grid
    
end

# Prints the grid to the terminal
def printLetterGrid(grid, width, height)

    # Iterate through each grid entry
    for y in 0..height-1 do

        for x in 0..width-1 do

            # Print the entry
            print "|#{grid[[x, y]]}"

        end

        print "|\n"

    end

end

# Returns true if any word checking conditions are met. Returns false if none are met
# conditionsToCheck is a hash table with 'check[NameOfCondition]' as key and true/false as value
def wordInGrid(grid, width, height, word, conditionsToCheck)

    if (conditionsToCheck["checkLeftToRight"])
        if wordInStrings(word, leftToRight(grid, width, height))
            return true
        end
    end

    if (conditionsToCheck["checkRightToLeft"])
        if wordInStrings(word, rightToLeft(grid, width, height))
            return true
        end
    end

    if (conditionsToCheck["checkTopToBottom"])
        if wordInStrings(word, topToBottom(grid, width, height))
            return true
        end
    end

    if (conditionsToCheck["checkBottomToTop"])
        if wordInStrings(word, bottomToTop(grid, width, height))
            return true
        end
    end

    if (conditionsToCheck["checkLeftToRightWraparound"])
        if wordInStrings(word, leftToRightWraparound(grid, width, height))
            return true
        end
    end

    if (conditionsToCheck["checkRightToLeftWraparound"])
        if wordInStrings(word, rightToLeftWraparound(grid, width, height))
            return true
        end
    end

    if (conditionsToCheck["checkTopToBottomWraparound"])
        if wordInStrings(word, topToBottomWraparound(grid, width, height))
            return true
        end
    end

    if (conditionsToCheck["checkBottomToTopWraparound"])
        if wordInStrings(word, bottomToTopWraparound(grid, width, height))
            return true
        end
    end

    if (conditionsToCheck["checkTopLeftToBottomRight"])
        if wordInStrings(word, topLeftToBottomRight(grid, width, height))
            return true
        end
    end

    if (conditionsToCheck["checkBottomRightToTopLeft"])
        if wordInStrings(word, bottomRightToTopLeft(grid, width, height))
            return true
        end
    end

    if (conditionsToCheck["checkTopRightToBottomLeft"])
        if wordInStrings(word, topRightToBottomLeft(grid, width, height))
            return true
        end
    end

    if (conditionsToCheck["checkBottomLeftToTopRight"])
        if wordInStrings(word, bottomLeftToTopRight(grid, width, height))
            return true
        end
    end


    # If the function has made it this far, then the word was
    # not found in the grid using any of the selected rules
    return false

end

# If 'word' is a substring of any string in strings, returns true
# Else, returns false
def wordInStrings(word, strings)
    for string in strings do

        if string.include? word
            return true
        end
    end

    return false
end

# Returns an array of strings, each one representing a left-to-right row in the grid
def leftToRight(grid, width, height)

    strings = Array.new
    string = String.new

    for y in 0..height-1 do

        string = ""

        for x in 0..width-1 do
            letter = grid[[x, y]]
            string << letter
        end

        strings << string
    end

    return strings
end

# Returns an array of strings, each one representing a right-to-left row in the grid
def rightToLeft(grid, width, height)

    strings = leftToRight(grid, width, height)

    for string in strings do
        string.reverse!
    end

    return strings
end

# Returns an array of strings, each one representing a top-to-bottom column in the grid
def topToBottom(grid, width, height)

    strings = Array.new
    string = String.new

    for x in 0..width-1 do

        string = ""

        for y in 0..height-1 do
            letter = grid[[x, y]]
            string << letter
        end

        strings << string

    end

    return strings
end

# Returns an array of strings, each one representing a bottom-to-top column in the grid
def bottomToTop(grid, width, height)

    strings = topToBottom(grid, width, height)

    for string in strings do
        string.reverse!
    end

    return strings
end

# TODO: Implement this function more elegantly
# Returns an array of strings, each one representing a topLeft-to-bottomRight diagonal in the grid
def topLeftToBottomRight(grid, width, height)

    strings = Array.new
    string = String.new

    # Get the top-right half of the grid, including the longest diagonal
    for x in 1..width do

        string = ""

        for y in 0..x-1 do

            letter = grid[[width-x + y, y]]

            string << letter

        end

        strings << string

    end

    # Get the bottom-left half of the grid, not including the longest diagonal
    # TODO: find a better way of doing this, without needing to reverse the string
    for x in 0..width-2 do

        string = ""

        for y in 0..x do

            letter = grid[[x-y, height - y - 1]]

            string << letter

        end

        string.reverse!

        strings << string

    end

    return strings

end

# Returns an array of strings, each one representing a bottomRight-to-topLeft diagonal in the grid
def bottomRightToTopLeft(grid, width, height)

    strings = topLeftToBottomRight(grid, width, height)

    for string in strings do
        string.reverse!
    end

    return strings

end

# TODO: Implement this function more elegantly
# Returns an array of strings, each one representing a topRight-to-bottomLeft diagonal in the grid
def topRightToBottomLeft(grid, width, height)

    strings = Array.new
    string = String.new

    # Get the top-left half of the grid, including the longest diagonal
    for x in 0..width-1 do

        string = ""

        for y in 0..x do

            letter = grid[[x - y, y]]

            string << letter

        end

        strings << string

    end

    # Get the bottom-right half of the grid, not including the longest diagonal
    # TODO: find a better way of doing this, without needing to reverse the string
    for x in 0..width-2 do

        string = ""

        for y in 0..x do

            letter = grid[[width - x + y - 1, height - y - 1]]

            string << letter

        end

        string.reverse!

        strings << string
    end

    return strings
end

# Returns an array of strings, each one representing a bottomLeft-to-topRight diagonal in the grid
def bottomLeftToTopRight(grid, width, height)

    strings = topRightToBottomLeft(grid, width, height)

    for string in strings do
        string.reverse!
    end

    return strings

end

width = 10
height = 10

grid = generateLetterGrid(width, height, fileToArray('acceptable_letters.txt'))
printLetterGrid(grid, width, height)

rules = Hash.new
rules["checkLeftToRight"] = true
rules["checkRightToLeft"] = true
rules["checkTopToBottom"] = true
rules["checkBottomToTop"] = true

while (true) do

    print "Word to find: "
    word = gets.chomp.to_s

    if (wordInGrid(grid, width, height, word, rules))
        puts "YES!"
    else
        puts "NO!"
    end

end