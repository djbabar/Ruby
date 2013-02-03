=begin
  modify text analyzer to use logging feature
=end

require 'logger'

class File_analyzer
  attr_reader  :lines, :character_count, :character_count_without_spaces, :line_count, :word_count, :sentence_count, :paragraph_count, :avg_num_words_per_sentence, :avg_num_sentences_per_paragraph
  def initialize(file='text.txt')
    @lines = File.readlines(file)
    $LOG.info("Reading file #{file}")
    file_stats
    $LOG.info("Statistics collected for #{file}")
  end

  def file_stats
    @line_count = @lines.length
    @text = @lines.join
    @character_count = @text.length
    @character_count_without_spaces = @text.gsub(/\s+/, '').length
    @word_count = @text.split(" ").length
    @sentence_count = @text.split(/\.|\?|!/).length
    @paragraph_count = @text.split(/\n\n/).length
    @avg_num_words_per_sentence = @word_count / sentence_count
    @avg_num_sentences_per_paragraph = @sentence_count / paragraph_count
  end
end


$LOG = Logger.new('fileread.log')
file = File_analyzer.new(*ARGV)

puts "Character count: #{file.character_count}"
puts "Character count (excluding spaces): #{file.character_count_without_spaces}"
puts "Line count: #{file.line_count}"
puts "Word count: #{file.word_count}"
puts "Sentence count: #{file.sentence_count}"
puts "Paragraph count: #{file.paragraph_count}"
puts "Average number of words per sentence: #{file.avg_num_words_per_sentence}"
puts "Average number of sentences per paragraph: #{file.avg_num_sentences_per_paragraph}"

