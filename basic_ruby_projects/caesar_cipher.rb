ASCII_UPCASE_INTERVAL = [*(65..90)]
ASCII_DOWNCASE_INTERVAL = [*(97..122)]
ALPHABET_LENGTH = 26

def caesar_cipher(text, key)
  encrypted_list = text.split('').map do |char|
    char_ord = char.ord

    unless ASCII_UPCASE_INTERVAL.include?(char_ord) || ASCII_DOWNCASE_INTERVAL.include?(char_ord)
      next char
    end

    max_ord = ASCII_UPCASE_INTERVAL.include?(char_ord) ? ASCII_UPCASE_INTERVAL.last : ASCII_DOWNCASE_INTERVAL.last
    new_ord = char_ord + key
    encrypted_ord = new_ord >= max_ord ? new_ord - ALPHABET_LENGTH : new_ord

    encrypted_ord.chr
  end

  p encrypted_list.join()
end

caesar_cipher("What a string!", 5)