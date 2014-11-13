# Generates a width-x-height grid where each [x,y] grid item
# is a random character contained in 'acceptableLetters'
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

