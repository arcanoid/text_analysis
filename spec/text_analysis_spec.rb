require 'spec_helper'

describe TextAnalysis do
  it 'has a version number' do
    expect(TextAnalysis::VERSION).not_to be nil
  end

  context 'properly analysis input text' do
    subject { TextAnalysis.analyze_text "The brown fox jumps over the lazy dog" }

    it { should be_an_instance_of TextAnalysis::Result }
    its(:total_characters) { should == 37 }
    its(:total_characters_without_whitespaces) { should == 30 }
    its(:total_words) { should == 8 }
    its(:stop_words_found) { should == ['The', 'over', 'the'] }
    its(:most_common_words) { should == [ { :word => 'the', :occurences => 2 },
                                          { :word => 'dog', :occurences => 1 },
                                          { :word => 'lazy', :occurences => 1 },
                                          { :word => 'over', :occurences => 1 },
                                          { :word => 'jumps', :occurences => 1 },
                                          { :word => 'fox', :occurences => 1 },
                                          { :word => 'brown', :occurences => 1 } ] }
    its(:most_common_non_stop_words) { should == [ { :word => 'dog', :occurences => 1 },
                                                   { :word => 'lazy', :occurences => 1 },
                                                   { :word => 'jumps', :occurences => 1 },
                                                   { :word => 'fox', :occurences => 1 },
                                                   { :word => 'brown', :occurences => 1 } ] }
  end

  describe TextAnalysis::Result do
    it { should respond_to :total_characters, :total_characters= }
    it { should respond_to :total_characters_without_whitespaces, :total_characters_without_whitespaces= }
    it { should respond_to :total_words, :total_words= }
    it { should respond_to :stop_words_found, :stop_words_found= }
    it { should respond_to :most_common_words, :most_common_words= }
    it { should respond_to :most_common_non_stop_words, :most_common_non_stop_words= }
  end
end
