module Todo
  class Parser

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