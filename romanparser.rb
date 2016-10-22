
module RomanParser
  Roman_lookup = {"I": 1,
                  "V": 5,
                  "X": 10,
                  "L": 50,
                  "C": 100,
                  "D": 500,
                  "M": 1000}

  def self.parse1(roman_string)
    roman_array = roman_string.upcase.each_char.to_a.map { |c| Roman_lookup[c.to_sym] }

    sum = 0

    while roman_array.length > 0

      # If it's just a single numeral left, add it and break the loop.
      if roman_array.length == 1
        sum += roman_array.shift
        break
      end

      memo = roman_array.shift

      # If the second numeral is greater than the first, subtract the lesser
      # numeral and add the remainder to sum and shift the greater numeral from
      # array. Else just add first numeral to sum.
      if roman_array.first > memo
        sum += roman_array.shift - memo
      else
        sum += memo
      end
    end

    return sum
  end
end

puts RomanParser::parse1(ARGV[0])
