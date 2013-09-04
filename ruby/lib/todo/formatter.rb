module Todo

  # Class that knows how to format items for storage
  class Formatter

    # Returns the items in a format suitable for persisting
    # @param items [Array<Todo::Task, Todo::Comment, Todo::Spacer>] the items to format
    # @return [String]
    def format(items)
      items.map(&:to_s).join
    end
  end
end