require 'open-uri'
require 'json'



class GamesController < ApplicationController
  def new
    letters_array = ('A'..'Z').to_a
    @letters = [letters_array.sample, letters_array.sample, letters_array.sample, letters_array.sample, letters_array.sample, letters_array.sample, letters_array.sample, letters_array.sample, letters_array.sample, letters_array.sample]
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params['word'].delete(' ')}"
    word_serialized = open(url).read
    word = JSON.parse(word_serialized)
    if word['found'] == true
      @results = "and your word is in dictionary"
    else
      @results = "and your word isn't in dictionary"
    end

    letter_array = params['word'].chars
    array2 = params['letters'].split(' ')

    if letter_array.each { |letter| array2.include?(letter) }
      @score = "Your letters: '#{params['word']}'' are included"
    else
      @score = "Your letters: '#{params['word']}'' aren't included"
      raise
    end
  end
end

# or .all?, break unless
