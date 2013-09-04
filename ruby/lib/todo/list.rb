module Todo

  # Class that contains all the tasks
  # Have methods to interact with the collection of tasks
  class List

    # @param [Array<Todo::Task, Todo::Comment, Todo::Spacer>] all items, the parsed result
    def initialize(items)
      @items = items
      @tasks = Hash.new
      @tasks['open'] = []
      @tasks['completed'] = []
      @items.each do |item|
        if item.is_a? Task
          if item.completed?
            @tasks['completed'] << item
          else
            @tasks['open'] << item
          end
        end
      end
    end

    # @return [Array<Todo::Task, Todo::Comment, Todo::Spacer>] all items
    def items
      @items
    end

    # @return [Array<Todo::Task>] all tasks
    def tasks
      @tasks['open'] + @tasks['completed']
    end

    # @return [Array<Todo::Task>] all open tasks
    def open
      @tasks['open']
    end

    # @return [Array<Todo::Task>] all completed tasks
    def completed
      @tasks['completed']
    end

    # @param task [Todo::Task] the new task
    # @return [Array<Todo::Task, Todo::Comment, Todo::Spacer>] all items
    def add(task)
      if task.completed?
        @tasks['completed'] << task
      else
        @tasks['open'] << task
      end
      @items << task
    end

    # Searches the collection for a task with the identifier
    # Identifier can be a regular expression, in string format. It will be converted before search.
    # @param identifier [String] the identifier to search for, can be a regular expression, in string format. It will be converted before search.
    # @return [Todo::Task, nil] returns the task if it exists, nil otherwise
    def find(identifier)
      pattern = Regexp.new identifier
      tasks.each do |task|
        return task if task.identifier =~ pattern
      end

      return nil
    end

    # @param identifier [String] the identifier to search for, can be a regular expression, in string format. It will be converted before search.
    # @return [Todo::Task, String] returns the deleted item if it exists, an error message otherwise
    def delete(identifier)
      task = find identifier
      return "The task \"#{identifier}\" does not exist" if task.nil?

      if task.completed?
        @tasks['completed'].delete task
      else
        @tasks['open'].delete task
      end
      @items.delete task
    end

    # @param identifier [String] the identifier to search for, can be a regular expression, in string format. It will be converted before search.
    # @param new_identifier [String] new identifier to give the task, nil doesn't update the value
    # @param estimated_time [String] new estimation to give the task, nil doesn't update the value
    # @param priority [String] new priority to give the task, nil doesn't update the value
    # @return [Object, String] returns an error message if the task doesn't exist
    def update(identifier, new_identifier = nil, estimated_time = nil, priority = nil)
      task = find identifier
      return "The task \"#{identifier}\" does not exist" if task.nil?

      task.update new_identifier, estimated_time, priority
    end
  end
end