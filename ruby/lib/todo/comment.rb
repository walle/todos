module Todo

  # Item that represents a comment
  class Comment

    # @return [String]
    attr_reader :text

    # @param text [String] the value of the comment
    def initialize(text)
      @text = text.strip
    end

    # Returns the comment representation
    # @return [String]
    def to_s
      "\# #{@text}\n"
    end

  end
end