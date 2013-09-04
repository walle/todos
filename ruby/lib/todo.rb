require 'time'

require 'todo/task'
require 'todo/comment'
require 'todo/spacer'
require 'todo/parser'
require 'todo/list'
require 'todo/formatter'
require 'todo/storage'
require 'todo/version'

# Module that ties the different classes together and provide a functional API
# Exposes the basic CRUD actions and the complete action
module Todo
  @storage = Storage.new
  @parser = Parser.new

  # Adds a new task to file
  # @param filename [String] path to the file to update
  # @param task [Todo::Task] the task to save
  # @return [String] the contents of the file
  def self.add(filename, task)
    items = self.parse filename
    list = List.new items
    list.add task
    save filename, list.items
  end

  # Displays all items to stdout
  # @param filename [String] path to the file to show
  def self.show(filename)
    items = self.parse filename
    list = List.new items

    puts 'Open tasks'
    puts
    list.open.each do |task|
      puts "  Identifier: #{task.identifier}"
      puts "  Estimated time: #{task.estimated_time}" unless task.estimated_time.nil? || task.estimated_time.length == 0
      puts "  Priority: #{task.priority}" unless task.priority.nil? || task.priority.length == 0
      puts
    end

    puts 'Completed tasks'
    puts
    list.completed.each do |task|
      puts "  - #{task.identifier} [#{task.completed_at}]"
    end
  end

  # Updates a task
  # @param filename [String] path to the file update
  # @param identifier [String] the name of the task, can be a regular expression
  # @param new_identifier [String] new identifier to give the task, nil doesn't update the value
  # @param estimated_time [String] new estimation to give the task, nil doesn't update the value
  # @param priority [String] new priority to give the task, nil doesn't update the value
  # @return [String] the contents of the file
  def self.update(filename, identifier, new_identifier = nil, estimated_time = nil, priority = nil)
    items = self.parse filename
    list = List.new items
    result = list.update identifier, new_identifier, estimated_time, priority
    if result.is_a? String
      puts result
    else
      save filename, list.items
    end
  end

  # Removes a task
  # @param filename [String] path to the file update
  # @param identifier [String] the name of the task, can be a regular expression
  # @return [String] the contents of the file
  def self.delete(filename, identifier)
    items = self.parse filename
    list = List.new items
    result = list.delete identifier
    if result.is_a? String
      puts result
    else
      save filename, list.items
    end
  end

  # Sets a task to completed
  # @param filename [String] path to the file update
  # @param identifier [String] the name of the task, can be a regular expression
  # @return [String] the contents of the file
  def self.complete(filename, identifier)
    items = self.parse filename
    list = List.new items
    task = list.find identifier
    if task
      task.complete!
      save filename, list.items
    else
      puts "The task \"#{identifier}\" does not exist"
    end
  end

  private

  # Parses the supplied file
  # @param filename [String] path to the file to parse
  # @return [Array]
  def self.parse(filename)
    contents = @storage.load(filename)
    @parser.parse contents
  end

  # Saves items back to file
  # @param filename [String] path to the file to save to
  # @param items [Array] the items to save
  # @return [String] the contents of the file
  def self.save(filename, items)
    @storage.save(filename, items, Formatter.new)
  end
end