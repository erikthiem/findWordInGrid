require_relative 'supporting_functions/file_operations'
require_relative 'supporting_functions/grid'
require_relative 'supporting_functions/generateStringArrays'
require_relative 'supporting_functions/checkWord'

width = 10
height = 10

grid = generateLetterGrid(width, height, fileToArray('data/acceptable_letters.txt'))
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
