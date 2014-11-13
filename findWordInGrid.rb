require_relative 'grid'
require_relative 'generateStringArrays'

# Generates an array of strings, each string represents a line from the file 'fileName'
def fileToArray(fileName)
    lines = Array.new
    File.foreach(fileName).with_index { |line|
        lines << line.chomp
    }
    return lines
end

# Returns true if any word checking conditions are met. Returns false if none are met
# conditionsToCheck is a hash table with 'check[NameOfCondition]' as key and true/false as value
def wordInGrid(grid, width, height, word, conditionsToCheck)

    conditionsToCheck.each do |conditionName, conditionResult|
        if (conditionResult)
            if wordInStrings(word, eval("#{conditionName}(grid, width, height)"))
                return true
            end
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

width = 10
height = 10

grid = generateLetterGrid(width, height, fileToArray('acceptable_letters.txt'))
printLetterGrid(grid, width, height)

rules = Hash.new
rules["leftToRight"] = true
rules["rightToLeft"] = true
rules["topToBottom"] = true
rules["bottomToTop"] = true

rules["leftToRightWraparound"] = true
rules["rightToLeftWraparound"] = true
rules["topToBottomWraparound"] = true
rules["bottomToTopWraparound"] = true

rules["topLeftToBottomRight"] = true
rules["bottomRightToTopLeft"] = true
rules["topRightToBottomLeft"] = true
rules["bottomLeftToTopRight"] = true

puts "\nTo exit, press ctrl-c\n\n"

while (true) do

    print "Word to find: "
    word = gets.chomp.to_s

    if (wordInGrid(grid, width, height, word, rules))
        puts "YES!"
    else
        puts "NO!"
    end

end
