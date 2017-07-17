module ToyRobot
  # Command Input
  class Input
    def initialize(str)
      @str = str
    end

    def first_word
      @str.split(' ').first
    end

    def first_downcase
      first_word.downcase
    end

    def first_capitalize
      first_word.capitalize
    end

    def but_first_word
      @str.split(' ').drop(1).join(' ')
    end

    def exit?
      !/exit/i.match(first_word).nil?
    end
  end
end
