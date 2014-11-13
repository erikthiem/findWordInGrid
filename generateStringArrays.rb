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

# Returns an array of strings, each one representing a left-to-right row in the grid, with wraparound
def leftToRightWraparound(grid, width, height)

    strings = leftToRight(grid, width, height)

    for string in strings do

        string << string

    end

    return strings

end

# Returns an array of strings, each one representing a right-to-left row in the grid, with wraparound
def rightToLeftWraparound(grid, width, height)

    strings = rightToLeft(grid, width, height)

    for string in strings do

        string << string

    end

    return strings

end

# Returns an array of strings, each one representing a top-to-bottom column in the grid, with wraparound
def topToBottomWraparound(grid, width, height)

    strings = topToBottom(grid, width, height)

    for string in strings do

        string << string

    end

    return strings

end

# Returns an array of strings, each one representing a bottom-to-top column in the grid, with wraparound
def bottomToTopWraparound(grid, width, height)

    strings = bottomToTop(grid, width, height)

    for string in strings do

        string << string

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
