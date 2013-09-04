module Todo

  # Class that knows how to parse out items from a String
  class Parser

    # Parses the input and returns an array with parsed classes
    # @param string [String] the data to parse
    # @return [Array<Todo::Task, Todo::Comment, Todo::Spacer>]
    def parse(string)
      items = []

      lines = string.lines.map(&:strip)
      lines.each do |line|
        case line[0]
        when '#'
          items << Comment.new(line[1..-1])
        when '*'
          parts = line[1..-1].split('-!-').map(&:strip)
          items << Task.new(parts[0], parts[1], parts[2])
        when '-'
          parts = line[1..-1].split('-!-').map(&:strip)
          items << Task.new(parts[0], parts[1], parts[2], Time.parse(parts[3]))
        else
          items << Spacer.new
        end
      end
      items
    end

  end
end