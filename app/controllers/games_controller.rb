class GamesController < ApplicationController
  def new
    # TODO: generate random grid of letter
    @start_time = Time.now.strftime('%s').to_i
    alphabet = ("A".."Z").to_a
    @grid = []
    counter = 0
    while counter != 10
      @grid << alphabet.sample
      counter += 1
    end
    @grid # this is an array
  end

  def included?(attempt, grid)
    attempt.chars.all? { |letter| attempt.count(letter) <= grid.count(letter) }
  end

  def compute_score(attempt, time_taken)
    time_taken > 60.0 ? 0 : attempt.size * (1.0 - time_taken / 60.0)
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def score_and_message(attempt, grid, time)
    if included?(attempt.upcase, grid)
      if english_word?(attempt)
        score = compute_score(attempt, time)
        [score, "well done"]
      else
        [0, "not an english word"]
      end
    else
      [0, "not in the grid"]
    end
  end

  def run_game(attempt, grid, start_time, end_time)
    @result = { time: end_time.to_i - start_time.to_i }
    score_and_message = score_and_message(attempt, grid, @result[:time])
    @result[:score] = score_and_message.first
    @result[:message] = score_and_message.last

    @result
  end

  def score
    @word = params[:attempt]
    @grid = params[:grid]
    @start_time = params[:start_time]
    @end_time = Time.now.strftime('%s').to_i
    run_game(@word, @grid, @start_time, @end_time)
  end
end
