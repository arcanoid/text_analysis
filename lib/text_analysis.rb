require "text_analysis/version"

module TextAnalysis
  def self.analyze_text(text_input)
    hash = {}

    hash[:total_characters] = text_input.length
    hash[:total_characters_without_whitespaces] = text_input.gsub(/\s+/, "").length
    hash[:total_words] = text_input.split(/[\w-]+/).size

    hash
  end
end
