require 'spec_helper'

describe TextAnalysis do
  it 'has a version number' do
    expect(TextAnalysis::VERSION).not_to be nil
  end

  it 'properly analysis input text' do
    expect(subject.analyze_text "The brown fox jumps over the lazy dog").to eq( { :total_characters => 37,
                                                                                  :total_characters_without_whitespaces => 30,
                                                                                  :total_words => 8,
                                                                                  :stop_words_found => ["The", "over", "the"],
                                                                                  :most_common_words => [ { :word => "the", :occurences => 2 },
                                                                                                          { :word => "dog", :occurences => 1 },
                                                                                                          { :word => "lazy", :occurences => 1 },
                                                                                                          { :word => "over", :occurences => 1 },
                                                                                                          { :word => "jumps", :occurences => 1 },
                                                                                                          { :word => "fox", :occurences => 1 },
                                                                                                          { :word => "brown", :occurences => 1 } ],
                                                                                  :most_common_non_stop_words => [ { :word => "dog", :occurences => 1 },
                                                                                                                   { :word => "lazy", :occurences => 1 },
                                                                                                                   { :word => "jumps", :occurences => 1 },
                                                                                                                   { :word => "fox", :occurences => 1 },
                                                                                                                   { :word => "brown", :occurences => 1 } ]
                                                                                } )
  end
end
