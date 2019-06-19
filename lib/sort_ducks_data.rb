def create_report(names)
  extinct = "Labrador Duck"
  return ["Disqualified data"] if names.any? { |str| str[extinct]}
  # split each item in array into words and numbers
  split_names = []
  names.each {|str| split_names.push(str.split(" "))}

  #set up a Hash
  ducks_hash = {}

  # use regex to change the names of the ducks
  split_names.each do |item|

    if item.length == 2
      # If a name has only one word, use the first six letters of the name.
      # If that name has less than six letters, use what is there.
      name = item[0].upcase
      name = name[/[a-zA-z]{1,6}/]
      if !ducks_hash.include? name
        ducks_hash[name] = item[1].to_i
      else
        ducks_hash[name] += item[1].to_i
      end
    end

    if item.length == 3
      #If a name has two words, take the first three letters of each word.
      name = item[0][0..2].upcase + item[1][0..2].upcase
      if !ducks_hash.include? name
        ducks_hash[name] = item[2].to_i
      else
        ducks_hash[name] += item[2].to_i
      end
    end

    if item.length == 4
      # If a name has three words, take the first two letters of each word.
    end

    if item.length == 5
      # If a name has four words, take the first letters from the first two words,
      #  and the first two letters from the last two words.
    end

  end
  return ducks_hash.sort.flatten
end

create_report(["Redhead 3", "Gadwall  1", "Smew 4", "Greater Scaup 10",
  "Redhead 3", "Gadwall 9", "Greater Scaup  15", "Common Eider 6"])
