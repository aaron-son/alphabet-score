# frozen_string_literal: true

# Calculates an assigned alphabet score
class Score
  def initialize(file_name, bonus_string)
    file = File.open(file_name).read
    @str = file.to_s.gsub("\n", '')
    @bonus_string = bonus_string.to_s
  end

  def total_score
    table = assign_table
    a_score = alphabet_score(table)
    b_score = bonus_score
    puts "Total Score: #{a_score + b_score}"
  end

  def assign_table
    alphabet = ('a'..'z').to_a
    table = {}
    value = 0
    alphabet.each_with_index do |letter, index|
      value = 0 if (index % 5).zero?
      table[letter.to_s] = value
      value += 1
    end
    table
  end

  def alphabet_score(table)
    puts table
    a_score = 0
    # Calculate Alphabet Score
    @str.downcase.chars.each do |letter|
      a_score += table[letter.to_s] unless table[letter.to_s].nil?
    end
    a_score
  end

  def bonus_score
    b_score = 0
    # Calculate Bonus Score
    @str.downcase.chars.each do |letter|
      b_score += 5 if @bonus_string.include?(letter)
    end
    b_score
  end
end

score = Score.new(ARGV[0], ARGV[1])
score.total_score
