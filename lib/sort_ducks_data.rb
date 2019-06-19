def create_report(names)
  return ['Disqualified data'] if names.any? { |str| str['Labrador Duck'] }

  split_names = []
  names.each { |str| split_names.push(str.split(/-|\s+/)) }

  hash = {}

  split_names.each do |item|
    if item.length == 2
      name = item[0][/[a-zA-z]{1,6}/].upcase
      !hash.include?(name) ? hash[name] = item[1].to_i : \
      hash[name] += item[1].to_i
    end

    if item.length == 3
      name = (item[0][0..2] + item[1][0..2]).upcase
      !hash.include?(name)? hash[name] = item[2].to_i : \
      hash[name] += item[2].to_i
    end

    if item.length == 4
      name = (item[0][0..1] + item[1][0..1] + item[2][0..1]).upcase
      !hash.include?(name)? hash[name] = item[3].to_i : \
      hash[name] += item[3].to_i
    end

    if item.length == 5
      name = (item[0][0] + item[1][0] + item[2][0..1] + item[3][0..1]).upcase
      !hash.include?(name) ? hash[name] = item[4].to_i : \
      hash[name] += item[4].to_i
    end
  end
  hash.sort.flatten
end
