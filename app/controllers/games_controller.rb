class GamesController < ApplicationController
  def new
    # TODO: generate random grid of letter
    alphabet = ("A".."Z").to_a
    @grid = []
    counter = 0
    while counter != 10
      @grid << alphabet.sample
      counter += 1
    end
    @grid # this is an array
  end

  def score
    raise
  end
end

# def run_game(attempt, grid, start_time, end_time)
#   # TODO: runs the game and return detailed hash of result
#   relevant_data = ""
#   open("https://wagon-dictionary.herokuapp.com/#{attempt}", "r") do |file|
#     file.each_line do |line|
#       relevant_data = line.split('\n')[0]
#     end
#   end

#   p relevant_data.class

#   attempt = attempt.upcase

#   result = JSON.parse(relevant_data)

#   p result.class

#   compare_attempt_array = attempt.split("")

#   p compare_attempt_array.class

#   if compare_attempt_array.all? { |ltr| grid.include?(ltr) } == false
#     result[:score] = 0
#     result[:message] = "#{attempt} is not in the grid"
#   elsif result["found"] == false
#     result[:score] = 0
#     result[:message] = "#{attempt} is not an english word"
#   else
#     result[:time] = (end_time.sec.to_i - start_time.sec.to_i)
#     result[:score] = result["length"] - result[:time]
#     result[:message] = "well done"
#   end

#   result
# end
# # %w{ant bear cat}.all? {|word| word.length >= 3}
# # run_game(apple, )

# p run_game("YXK", ["Y", "X", "K", "Z", "B", "I", "T", "C", "H"], Time.now, Time.now + 1)
#   end
