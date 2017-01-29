
def word_counter
  filename = ARGV[0]
  word_number = ARGV[1].to_i
  new_hash = {}

  File.open(filename, 'r') do |file|
    words = file.read.split(/[^[[:word:]]]+/)
    words.each do |word|
      word.gsub(/[,.!?;:*&"]/, '')

      if new_hash[word]
        new_hash[word] += 1
      else
        new_hash[word] = 1
      end
    end

    File.open("stop_words.txt", 'r') do |file|
      stop_words = file.read.split(" ")
      stop_words.each do |stop_word|
        if new_hash[stop_word]
          new_hash[stop_word] = 0
        end
      end
    end

    puts "The Top #{word_number} Words Are: "
    final_hash = new_hash.sort_by{ |key, value| value}.reverse[0..word_number].to_h
    final_hash.each do |key, value|
      puts "#{key}: #{value}"
    end
  end
end
word_counter
