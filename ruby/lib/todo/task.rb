module Todo

  # Item that represents a task
  class Task

    # @return [String]
    attr_reader :identifier, :estimated_time, :priority, :completed_at

    # @param identifier [String]
    # @param estimated_time [String]
    # @param priority [String]
    # @param completed_at [String, Time]
    def initialize(identifier, estimated_time = nil, priority = nil, completed_at = nil)
      @identifier, @estimated_time, @priority, @completed_at = identifier, estimated_time, priority, completed_at
      @completed = !@completed_at.nil?
    end

    # @return [Boolean]
    def completed?
      @completed
    end

    # Sets completed_at to current time
    # @return [Time]
    def complete!
      @completed = true
      @completed_at = Time.now
    end

    # @param identifier [String]
    # @param estimated_time [String]
    # @param priority [String]
    def update(identifier = nil, estimated_time = nil, priority = nil)
      @identifier = identifier unless identifier.nil?
      @estimated_time = estimated_time unless estimated_time.nil?
      @priority = priority unless priority.nil?
    end

    # Returns the task representation
    # @return [String]
    def to_s
      if completed?
        "- #{@identifier} -!- #{@estimated_time} -!- #{@priority} -!- #{@completed_at}\n"
      else
        "* #{@identifier} -!- #{@estimated_time} -!- #{@priority}\n"
      end
    end

    # Define the equal requirements
    # @param 0 [Object]
    def ==(o)
      o.class == self.class && o.state == state
    end
    alias_method :eql?, :==

    protected

    # Return all relevant data members as an array, used to make an easy compare method
    def state
      [@identifier, @estimated_time, @priority, @completed_at]
    end

  end
end