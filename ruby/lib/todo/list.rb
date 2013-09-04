module Todo
  class List

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

    def items
      @items
    end

    def tasks
      @tasks['open'] + @tasks['completed']
    end

    def open
      @tasks['open']
    end

    def completed
      @tasks['completed']
    end

    def add(task)
      if task.completed?
        @tasks['completed'] << task
      else
        @tasks['open'] << task
      end
      @items << task
    end

    def find(identifier)
      pattern = Regexp.new identifier
      tasks.each do |task|
        return task if task.identifier =~ pattern
      end

      return nil
    end

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

    def update(identifier, new_identifier = nil, estimated_time = nil, priority = nil)
      task = find identifier
      return "The task \"#{identifier}\" does not exist" if task.nil?

      task.update new_identifier, estimated_time, priority
    end
  end
end