require "text_analysis/version"

module TextAnalysis
  def self.analyze_text(text_input)
    hash = {}

    stop_words = File.readlines('data/stop_words/en.txt').map { |word| word.gsub("\n", '') }.inspect
    input_words = text_input.split(/[\s]+/)

    hash[:total_characters] = text_input.length
    hash[:total_characters_without_whitespaces] = text_input.gsub(/\s+/, "").length
    hash[:total_words] = input_words.size
    hash[:stop_words_found] = input_words.select { |word| stop_words.include? word.downcase }.uniq
    hash[:most_common_words] =
        input_words.
            group_by { |word| word.downcase }.
            map { |k,v| { :word => k, :occurences => v.size } }.
            sort_by { |hash| hash[:occurences] }.
            reverse

    hash[:most_common_non_stop_words] =
        input_words.
            reject { |word| stop_words.include? word.downcase }.
            group_by { |word| word.downcase }.
            map { |k,v| { :word => k, :occurences => v.size } }.
            sort_by { |hash| hash[:occurences] }.
            reverse

    hash
  end
end
