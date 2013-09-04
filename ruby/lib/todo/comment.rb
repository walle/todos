module Todo
  class Comment

    attr_reader :text

    def initialize(text)
      @text = text.strip
    end

    def to_s
      "\# #{@text}\n"
    end

  end
end