ALPHABET = ('a'..'z').to_a

#
# NOTE: https://www.hackerrank.com/challenges/ruby-enumerable-collect/problem?isFullScreen=true
#
def rot13(secret_messages)
  secret_messages.map do |message|
    message.split('').map do |letter|
      begin
        if letter.downcase == letter
          ALPHABET[ALPHABET.index(letter) - 13]
        else
          ALPHABET[ALPHABET.index(letter.downcase) - 13].upcase
        end
      rescue
        letter
      end
    end.join('')
  end
end
