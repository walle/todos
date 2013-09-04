module Todo
  class Formatter

    def format(items)
      items.map(&:to_s).join
    end
  end
end