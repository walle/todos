module Todo
  class Storage

    def load(filename)
      File.open(filename, 'w') {} unless File.exists?(filename)
      File.read(filename)
    end

    def save(filename, items, formatter)
      contents = formatter.format(items)
      File.open(filename, 'w') { |file| file.write(contents) }
      return contents
    end
  end
end