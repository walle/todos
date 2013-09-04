module Todo

  # Class that knows how to persist and fetch items
  class Storage

    # Loads the items as a string intended for the {Todo::Parser} to consume
    # @param filename [String] the path to the file to load
    # @return [String]
    def load(filename)
      File.open(filename, 'w') {} unless File.exists?(filename)
      File.read(filename)
    end

    # Persists the items
    # @param filename [String] the path to the file to save to
    # @param items [Array<Todo::Task, Todo::Comment, Todo::Spacer>] the items to save
    # @param formatter [Todo::Formatter] the formatter to use when persisting
    # @return [String]
    def save(filename, items, formatter)
      contents = formatter.format(items)
      File.open(filename, 'w') { |file| file.write(contents) }
      return contents
    end
  end
end