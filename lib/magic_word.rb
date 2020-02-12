# frozen_string_literal: true

# Creates a randomly chosen word and split it into an array for manipulation
class MagicWord
  attr_reader :string, :data, :constant
  def initialize
    word_file = './lib/5desk.txt'
    @string = File.readlines(word_file).sample.strip.downcase
    @data = @string.split('')
    @constant = @string.split('')
  end
end
