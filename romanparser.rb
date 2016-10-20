
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
    memo = roman_array.shift

    while roman_array.length > 0
      if roman_array.first > memo
        sum += roman_array.shift - memo
      else
        sum += memo
      end
      memo = roman_array.shift

      if roman_array.length == 0 && memo
        sum += memo
      end
    end

    return sum
  end
end

puts RomanParser::parse1(ARGV[0])
