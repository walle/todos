require 'test_helper'

class TaskTest < Test::Unit::TestCase

  def setup
    @identifier = 'Item 1'
    @estimated_time = '5 hours'
    @priority = 'Urgent'
    @subject = Todo::Task.new(@identifier, @estimated_time, @priority)
  end

  def test_sets_values_correctly
    assert_equal @identifier, @subject.identifier
    assert_equal @estimated_time, @subject.estimated_time
    assert_equal @priority, @subject.priority
    assert_equal false, @subject.completed?
    assert_equal nil, @subject.completed_at
  end

  def test_can_be_completed
    time = stub_time

    assert_equal false, @subject.completed?
    @subject.complete!
    assert_equal true, @subject.completed?
    assert_equal Time.now, @subject.completed_at
  end

  def test_outputs_valid_to_s
    time = stub_time

    expected_open = "* #{@identifier} -!- #{@estimated_time} -!- #{@priority}\n"
    expected_completed = "- #{@identifier} -!- #{@estimated_time} -!- #{@priority} -!- #{time}\n"
    assert_equal expected_open, @subject.to_s
    @subject.complete!
    assert_equal expected_completed, @subject.to_s
  end

  def test_equality
    task1 = Todo::Task.new('Item 1', '2 minutes', 'Normal')
    task2 = Todo::Task.new('Item 1', '2 minutes', 'Normal')
    assert_equal task1, task2
  end

  def test_can_be_updated
    @subject.update 'Item 2', '6 hours', 'Low'
    assert_equal 'Item 2', @subject.identifier
    assert_equal '6 hours', @subject.estimated_time
    assert_equal 'Low', @subject.priority
  end

  def stub_time
    time = Time.parse('2013-09-03 15:09:22 +0200')
    stub(Time).now { time }
    return time
  end
end