require 'spec_helper'

describe TextAnalysis do
  it 'has a version number' do
    expect(TextAnalysis::VERSION).not_to be nil
  end

  it 'properly analysis input text' do
    expect(subject.analyze_text "The brown fox jumps over the lazy dog").to eq( { :total_characters => 37,
                                                                                  :total_characters_without_whitespaces => 30,
                                                                                  :total_words => 8  } )
  end
end
