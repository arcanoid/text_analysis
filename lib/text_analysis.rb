require "text_analysis/version"

module TextAnalysis
  ROOT = File.expand_path("../..", __FILE__)
  
  def self.analyze_text(text_input)
    # TODO: What about punctuation points? ".,?!`)(;:-'

    result = Result.new

    stop_words = File.readlines("#{ROOT}/data/stop_words/en.txt").map { |word| word.gsub("\n", '') }.inspect
    input_words = text_input.split(/[\s]+/)

    result.total_characters = text_input.length
    result.total_characters_without_whitespaces = text_input.gsub(/\s+/, "").length
    result.total_words = input_words.size
    result.stop_words_found = input_words.select { |word| stop_words.include? word.downcase }.uniq
    result.most_common_words =
        input_words.
            group_by { |word| word.downcase }.
            map { |k,v| { :word => k, :occurences => v.size } }.
            sort_by { |hash| hash[:occurences] }.
            reverse

    result.most_common_non_stop_words =
        input_words.
            reject { |word| stop_words.include? word.downcase }.
            group_by { |word| word.downcase }.
            map { |k,v| { :word => k, :occurences => v.size } }.
            sort_by { |hash| hash[:occurences] }.
            reverse

    result
  end

  class Result
    attr_accessor :total_characters,
                  :total_characters_without_whitespaces,
                  :total_words,
                  :stop_words_found,
                  :most_common_words,
                  :most_common_non_stop_words
  end
end
