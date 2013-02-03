=begin
  modify text analyzer to use logging feature
=end

def text_analyzer(file='text.txt')

  lines = File.readlines(file)
  line_count = lines.length
  text = lines.join
  character_count = text.length
  character_count_without_spaces = text.gsub(/\s+/, '').length
  word_count = text.split(" ").length
  sentence_count = text.split(/\.|\?|!/).length
  paragraph_count = text.split(/\n\n/).length
  ave_num_words_per_sentence = word_count / sentence_count
  ave_num_sentences_per_paragraph = sentence_count / paragraph_count

  puts "Character count: #{character_count}"
  puts "Character count (excluding spaces): #{character_count_without_spaces}"
  puts "Line count: #{line_count}"
  puts "Word count: #{word_count}"
  puts "Sentence count: #{sentence_count}"
  puts "Paragraph count: #{paragraph_count}"
  puts "Average number of words per sentence: #{ave_num_words_per_sentence}"
  puts "Average number of sentences per paragraph: #{ave_num_sentences_per_paragraph}"
end

text_analyzer(*ARGV)
