dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
input = "Howdy partner, sit down! How's it going?"

def substrings(input_string, dictionary)
    # Iterate through dictionary array and select the elements that match the input string
    # Count those elements and create a hash
    sub_strings = input_string.gsub!(/[^\w\s]/, '').gsub!(" ", "").downcase!
        p input_string
        dictionary.reduce(Hash.new(0)) do |a, element|
            if input_string.include?(element)
                a[element] += input_string.scan(element).count
                a    
            else
                a
            end
        end
end

p substrings(input, dictionary)
