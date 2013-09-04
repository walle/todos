module Todo
  class Task

    attr_reader :identifier, :estimated_time, :priority, :completed_at

    def initialize(identifier, estimated_time = nil, priority = nil, completed_at = nil)
      @identifier, @estimated_time, @priority, @completed_at = identifier, estimated_time, priority, completed_at
      @completed = !@completed_at.nil?
    end

    def completed?
      @completed
    end

    def complete!
      @completed = true
      @completed_at = Time.now
    end

    def update(identifier = nil, estimated_time = nil, priority = nil)
      @identifier = identifier unless identifier.nil?
      @estimated_time = estimated_time unless estimated_time.nil?
      @priority = priority unless priority.nil?
    end

    def to_s
      if completed?
        "- #{@identifier} -!- #{@estimated_time} -!- #{@priority} -!- #{@completed_at}\n"
      else
        "* #{@identifier} -!- #{@estimated_time} -!- #{@priority}\n"
      end
    end

    def ==(o)
      o.class == self.class && o.state == state
    end
    alias_method :eql?, :==

    protected

    def state
      [@identifier, @estimated_time, @priority, @completed_at]
    end

  end
end