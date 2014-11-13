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
