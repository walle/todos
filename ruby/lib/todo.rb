require 'time'

require 'todo/task'
require 'todo/comment'
require 'todo/spacer'
require 'todo/parser'
require 'todo/list'
require 'todo/formatter'
require 'todo/storage'
require 'todo/version'

module Todo
  @storage = Storage.new
  @parser = Parser.new

  def self.parse(filename)
    contents = @storage.load(filename)
    @parser.parse contents
  end

  def self.save(filename, items)
    @storage.save(filename, items, Formatter.new)
  end

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

  def self.add(filename, task)
    items = self.parse filename
    list = List.new items
    list.add task
    save filename, list.items
  end

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
end