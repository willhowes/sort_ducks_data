def create_report(names)
  extinct = "Labrador Duck"
  return ["Disqualified data"] if names.any? { |str| str[extinct]}

  split_names = []

  names.each {|str| split_names.push(str.split(/-|\s+/))}

  ducks_hash = {}

  split_names.each do |item|

    if item.length == 2
      name = item[0].upcase
      name = name[/[a-zA-z]{1,6}/]
      if !ducks_hash.include? name
        ducks_hash[name] = item[1].to_i
      else
        ducks_hash[name] += item[1].to_i
      end
    end

    if item.length == 3
      name = item[0][0..2].upcase + item[1][0..2].upcase
      if !ducks_hash.include? name
        ducks_hash[name] = item[2].to_i
      else
        ducks_hash[name] += item[2].to_i
      end
    end

    if item.length == 4
      name = item[0][0..1].upcase + item[1][0..1].upcase + item[2][0..1].upcase
      if !ducks_hash.include? name
        ducks_hash[name] = item[3].to_i
      else
        ducks_hash[name] += item[3].to_i
      end
    end

    if item.length == 5
      name = item[0][0].upcase + item[1][0].upcase + item[2][0..1].upcase + item[3][0..1].upcase
      if !ducks_hash.include? name
        ducks_hash[name] = item[4].to_i
      else
        ducks_hash[name] += item[4].to_i
      end
    end

  end
  return ducks_hash.sort.flatten
end
